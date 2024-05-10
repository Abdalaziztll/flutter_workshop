import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:unit_test_project/model/resutlt_model.dart';
import 'package:unit_test_project/model/signup_model.dart';
import 'package:unit_test_project/service/signup_serivce.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async{
      AuthService authapi = AuthService();
      var resutl =await authapi.singUpMethod(event.user);
      if (resutl is TokenModel) {
        emit(Success());
      }else {
        emit(Error());
      }
    });
  }
}
