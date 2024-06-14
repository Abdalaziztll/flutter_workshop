// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class Login extends AuthEvent {}

class FirstStep extends AuthEvent {
 final String firstName;
 final String lastName;
 final String username;
 final String phone;
 final String birthDate;
  FirstStep({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.birthDate,
  });
}

class SecondStep extends AuthEvent {
  
final  String password;
final  String confirmPassword;
  SecondStep({
    required this.password,
    required this.confirmPassword,
  });
}


