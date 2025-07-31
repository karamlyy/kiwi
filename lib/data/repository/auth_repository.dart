import 'package:dartz/dartz.dart';
import 'package:kiwi/data/endpoint/auth/login_endpoint.dart';
import 'package:kiwi/data/exception/error.dart';
import 'package:kiwi/data/model/auth/login_model.dart';
import 'package:kiwi/data/service/api/api.dart';

abstract class AuthRepository {
  Future<Either<HttpException, LoginModel>> login(LoginInput input);
}

class AuthRepositoryImpl extends AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, LoginModel>> login(LoginInput input) async {
    return await apiService.task<LoginModel>(LoginEndpoint(input));
  }
}
