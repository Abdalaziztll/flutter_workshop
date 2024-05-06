part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class SigningUp extends LoginEvent {
  SignUpInfo user;

  SigningUp({required this.user});
}
