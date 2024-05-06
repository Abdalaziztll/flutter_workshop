import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    bool isSigendUp = false;
    on<SigendUp>((event, emit) {
      emit(HeSigendUp());
      print("object");
      isSigendUp = true;
    });
  }
}
