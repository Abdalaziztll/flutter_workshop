import 'package:dio/dio.dart';
import 'package:riverpod_session/model/user_model.dart';

class UserService {
  Future<List<UserModel>> getUsers() async {
    Dio dio = Dio();
    var response = await dio.get('https://dummyjson.com/users');
    if (response.statusCode == 200) {
      List<UserModel> users = List.generate(
        response.data['users'].length,
        (index) => UserModel.fromMap(
          response.data['users'][index],
        ),
      );
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
