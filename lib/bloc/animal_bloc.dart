import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mock_and_init_careem/model/handling.dart';
import 'package:mock_and_init_careem/model/response/animal_model.dart';
import 'package:mock_and_init_careem/service/mock/mock_animal_service.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc() : super(AnimalInitial()) {
    on<GetAnimal>((event, emit) async {
      emit(LoadingFetching());

      var data = await MockAnimalService().getAnimals();
      if (data is ListOf<AnimalModel>) {
        emit(SuccessGetAnimal(result: data.resutl));
      } else {
        emit(ErrorFetchingData());
      }
    });
  }
}
