import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    print(state);
    on<Increament>((event, emit) {
      emit(state + 1);
      print(state);
    });

    on<Decreament>((event, emit) {
      emit(state - 1);
      print(state);
    });
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['value'];
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {"value": state};
  }
}
