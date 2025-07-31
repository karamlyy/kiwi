import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/data/exception/error.dart';
import 'package:kiwi/data/service/preferences/preferences.dart';
import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/utils/api_routes.dart';
import 'package:flutter/material.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;

  ApiInterceptor({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await PreferencesService.instance;
    options.headers["accept"] = "*/*";
    options.headers["Accept-Encoding"] = "gzip, deflate, br";
    options.headers["deviceId"] = await _getDeviceId();

    if (prefs.accessToken != null) {
      options.headers["Authorization"] = prefs.accessToken;
    }

    log("HEADERS: ${options.headers}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final prefs = await PreferencesService.instance;

    if (err.response?.statusCode == 401) {
      RequestOptions options = err.requestOptions;

      try {
        final refreshResult = await dio.post(
          ApiRoutes.refreshToken,
          options: Options(
            headers: {
              "Refresh-Token": prefs.refreshToken,
            },
          ),
        );

        final newAccessToken = refreshResult.data["token"];
        await prefs.setAccessToken(newAccessToken);
        options.headers["Authorization"] = newAccessToken;

        final response = await dio.fetch(options);
        return handler.resolve(response);
      } catch (e) {
        await _clearSession();
        return handler.reject(err);
      }
    }

    String errorMessage = "An unknown error occurred";

    if (err.response != null) {
      final statusCode = err.response?.statusCode;
      final data = err.response?.data;

      if (data is Map<String, dynamic>) {
        if (data.containsKey('code') && data['code'] == "179") {
          Navigation.pushReplacement(RouteName.changePassword);
          return;
        } else if (data.containsKey('code') && data['code'] == "429") {
          _clearSession();
          return;
        } else if (data.containsKey('messages') && data['messages'] is List) {
          errorMessage = data['messages'].join(", ");
        } else if (data.containsKey('message')) {
          errorMessage = data['message'];
        }
      } else if (data is String) {
        errorMessage = data;
      }

      log("ERROR[$statusCode] => MESSAGE: $errorMessage");
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: HttpException(
          error: ErrorMessage(
            message: errorMessage,
            code: err.response?.statusCode,
          ),
        ),
      ),
    );
  }

  Future<String?> _getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }

  Future<void> _clearSession() async {
    final prefs = await PreferencesService.instance;
    await prefs.clear();
    await prefs.setAuthorizationPassed(false);
    Navigation.pushNamedAndRemoveUntil(RouteName.login, arguments: false);
    ScaffoldMessenger.of(Navigation.context).showSnackBar(
      const SnackBar(
        content: Text("Session expired, please log in again."),
      ),
    );
  }
}
