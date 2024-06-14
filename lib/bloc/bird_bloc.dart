import 'package:bloc/bloc.dart';
import 'package:deep_div/model/bird_model.dart';
import 'package:deep_div/model/handling.dart';
import 'package:deep_div/service/bird_service.dart';
import 'package:meta/meta.dart';

part 'bird_event.dart';
part 'bird_state.dart';

      BirdService api = BirdService();
class BirdBloc extends Bloc<BirdEvent, BirdState> {
  BirdBloc() : super(BirdInitial()) {
    on<GetOneBird>((event, emit) async {

      emit(LoadingBird());
      ResultModel result = await api.getOndBird();
      if (result is BirdModel) {
        emit(SuccessToGetBird(birdModel: result));
      } else {
        emit(Error());
      }
    });
  }
}
