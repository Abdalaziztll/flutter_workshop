import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tdd_and_mocking/model/failed_model.dart';
import 'package:tdd_and_mocking/model/token_model.dart';
import 'package:tdd_and_mocking/model/user_model.dart';
import 'package:tdd_and_mocking/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo repo;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      var data = await repo.signup(event.user);
      if (data is TokenModel) {
        emit(Success());
      } else {
        emit(Failed(message: (data as DataFailed).messeg));
      }
    });
  }
}
