import 'package:mock_and_init_careem/model/handling.dart';
import 'package:mock_and_init_careem/model/response/animal_model.dart';
import 'package:mock_and_init_careem/service/animal_service.dart';
import 'package:mockito/mockito.dart';

class MockAnimalService extends Mock implements AnimalService {
  @override
  Future<ResultModel> getAnimals() async {
    List<Map<String, dynamic>> temp = [
      {
        "name": "name 1",
        "image": "https://loremflickr.com/640/480/animals",
        "id": "1"
      },
      {
        "name": "name 2",
        "image": "https://loremflickr.com/640/480/animals",
        "id": "2"
      },
      {
        "name": "name 3",
        "image": "https://loremflickr.com/640/480/animals",
        "id": "3"
      },
      {
        "name": "name 4",
        "image": "https://loremflickr.com/640/480/animals",
        "id": "4"
      }
    ];

    if (temp.isEmpty) {
      List<AnimalModel> animalModel = List.generate(
        temp.length,
        (index) => AnimalModel.fromMap(
          temp[index],
        ),
      );
      return ListOf(
        resutl: animalModel,
      );

      
    } else {
      List<AnimalModel> animalModel = List.generate(
        temp.length,
        (index) => AnimalModel.fromMap(temp[index]),
      );
      return ListOf(
        resutl: animalModel,
      );
    }
  }
}
