// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class Success extends AuthState {}

class Failed extends AuthState {
  String message;
  Failed({
    required this.message,
  });
}
