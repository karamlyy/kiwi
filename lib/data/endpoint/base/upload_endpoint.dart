import 'package:dio/dio.dart';
import 'package:kiwi/data/endpoint/base/endpoint.dart';

abstract class UploadEndpoint extends Endpoint {
  FormData data();
}
