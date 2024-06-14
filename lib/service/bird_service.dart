import 'package:deep_div/model/bird_model.dart';
import 'package:deep_div/model/handling.dart';
import 'package:dio/dio.dart';

class Servive {
  Dio dio = Dio();
  late Response response;
  String baseurl = "https://freetestapi.com/api/v1/birds/1";
}

class BirdService extends Servive {
  BirdModel? birdModel = null;
  Future<ResultModel> getOndBird() async {
    try {
      if (birdModel != null) {
        print("From Cache");
        return birdModel!;
      } else {
        response = await dio.get(baseurl);
        print("From Service");
        birdModel = BirdModel.fromMap(response.data);
        return birdModel!;
      }
    } catch (e) {
      return ExceptionModel();
    }
  }
}
