// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Api {
  get();
  post();

}

class DioApi extends Api {
  Dio dio = Dio();

  @override
  get() {
    dio.get('');
  }

  @override
  post() {
    dio.post('path');
  }
}
