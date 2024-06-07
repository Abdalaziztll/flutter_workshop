import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mock_and_init_careem/model/handling.dart';
import 'package:mock_and_init_careem/model/user_model.dart';
import 'package:mock_and_init_careem/service/mock/mock_user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<Login>((event, emit) async{
      emit(Loading());
      var status = await MockUserService().logIn(event.user);
      if (status is SuccessModel) {
        emit(SuccessToLogin());
      } else {
        emit(Error(message: (status as ExceptionModel).message));
      }
    });
  }
}
