// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {
  UserModel user;
  SignUpEvent({
    required this.user,
  });
}