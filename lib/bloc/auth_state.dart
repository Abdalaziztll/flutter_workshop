// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable{}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class Success extends AuthState {
  UserModel user;
  Success({
    required this.user,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class Loading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
