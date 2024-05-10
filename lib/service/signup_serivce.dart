import 'package:dio/dio.dart';
import 'package:unit_test_project/model/resutlt_model.dart';
import 'package:unit_test_project/model/signup_model.dart';

abstract class Serivec {
  ApiConusmer api = ApiConusmer();
  late Response response;
  final String baseurl =
      "https://projects-management-system.onrender.com/api/v1/auth/register";
}

class ApiConusmer {
  Dio dio = Dio();
}

class AuthService extends Serivec {
  Future<ResultModel> singUpMethod(UserSignUpModel user) async {
    response = await api.dio.post(baseurl, data: user.toMap());

    if (response.statusCode == 200) {
      
      return TokenModel(token: response.data['token']);
    } else {
      return ErrorModel(error: 'No Internet');
    }
  }
}
