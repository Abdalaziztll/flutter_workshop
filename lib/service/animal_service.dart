import 'package:dio/dio.dart';
import 'package:mock_and_init_careem/model/handling.dart';
import 'package:mock_and_init_careem/model/response/animal_model.dart';

class AnimalService {
  Dio dio = Dio();
  String baseUrl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/Animal";
  late Response response;

  Future<ResultModel> getAnimals() async {
    try {
      response = await dio.get(
        baseUrl,
      );
      if (response.statusCode == 200) {
        List<AnimalModel> animalModel = List.generate(
          response.data.length,
          (index) => AnimalModel.fromMap(
            response.data[index],
          ),
        );
        return ListOf(
          resutl: animalModel,
        );
      } else {
        return ErrorModel(
          messge: "",
        );
      }
    } on DioException catch (e) {
      return ExceptionModel(
        message: e.message!,
      );
    }
  }
}
