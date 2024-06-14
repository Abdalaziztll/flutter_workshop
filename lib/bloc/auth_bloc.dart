import 'package:bloc/bloc.dart';
import 'package:deep_div/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    UserModel finalUser = UserModel(
        firstName: '',
        lastName: '',
        username: '',
        phone: '',
        password: '',
        confirmPassword: '',
        birthDate: '');

    on<FirstStep>((event, emit) {
      finalUser = finalUser.copyWith(
          firstName: event.firstName,
          birthDate: event.birthDate,
          lastName: event.lastName,
          phone: event.phone,
          username: event.username);
      print("From First Event");
      print(finalUser.toMap());
    });

    on<SecondStep>(
      (event, emit) {
        finalUser = finalUser.copyWith(
            password: event.password, confirmPassword: event.confirmPassword);
        print("From Second Event");
        print(finalUser.toMap());
      },
    );

    on<Login>(
      (event, emit) {
        print(finalUser.toMap());
      },
    );
  }
}
