import 'package:dio/dio.dart';
import 'package:tdd_and_mocking/model/error/expeptions.dart';
import 'package:tdd_and_mocking/model/user_model.dart';


class  Service {
  
  final Dio dio;
  late Response response;
  String baseUrl = "https://rideshare.devscape.online/api/v1/auth/register";
  Service(this.dio);
}



class AuthService extends Service{
  AuthService(super.dio);



  Future<Response> signUp(UserModel user) async {
    try {
      response = await dio.post(baseUrl, data: user.toMap());
      return response;
    } on DioException catch (e) {
      if (e.response!.data["message"] == "username already in use") {
        throw UsedUserNameBefore();
      }else {
      print(e.response!.data);
      throw e;

      }
    }
  }
}
