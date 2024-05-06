part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}


class Success extends LoginState {}
class Error extends LoginState {}
class Loading extends LoginState {}