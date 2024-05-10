part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class Success extends AuthState {

}

class Error extends AuthState {}