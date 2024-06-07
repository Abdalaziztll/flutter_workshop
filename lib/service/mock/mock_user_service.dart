import 'dart:developer';

import 'package:mock_and_init_careem/model/handling.dart';
import 'package:mock_and_init_careem/model/user_model.dart';
import 'package:mock_and_init_careem/service/user_service/user_service.dart';
import 'package:mockito/mockito.dart';

class MockUserService extends Mock implements UserService {
  @override
  Future<ResultModel> logIn(UserModel user) async {
    log(user.email);
    if (user.email.isNotEmpty) {
      return SuccessModel();
    } else {
      return ExceptionModel(
        message: 'Fake Exception',
      );
    }
  }
}
