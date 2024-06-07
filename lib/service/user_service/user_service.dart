import 'package:dio/dio.dart';
import 'package:mock_and_init_careem/model/handling.dart';
import 'package:mock_and_init_careem/model/user_model.dart';

class UserService {
  Dio dio = Dio();

  late Response response;
  String baseurl = "";

  Future<ResultModel> logIn(UserModel user) async {
    try {
      response = await dio.post(
        baseurl,
        data: user.toMap(),
      );
      if (response.statusCode == 200) {
        // TODO : save token in shared preferences and get Header config
        return SuccessModel();
      } else {
        return ErrorModel(
          messge: "The error might be not 200",
        );
      }
    } on DioException catch (e) {
      return ExceptionModel(
        message: e.message.toString(),
      );
    }
  }
}
