import 'package:dio/dio.dart';
import 'package:tdd_and_mocking/model/base_model.dart';
import 'package:tdd_and_mocking/model/error/expeptions.dart';
import 'package:tdd_and_mocking/model/failed_model.dart';
import 'package:tdd_and_mocking/model/token_model.dart';
import 'package:tdd_and_mocking/model/user_model.dart';
import 'package:tdd_and_mocking/service/auth_service.dart';

class AuthRepo {
  final AuthService authService;

  AuthRepo(this.authService);

  Future<DataModel> signup(UserModel user) async {
    try {
      var data = await authService.signUp(user);
      // ? Save the token
      return TokenModel();
    } on UsedUserNameBefore catch (e) {
      return DataFailed(messeg: "User Name Has Been Used Before");
    } on DioException catch (e) {
      return DataFailed(messeg: e.toString());
    }
  }
}

