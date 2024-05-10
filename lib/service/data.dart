import 'package:dio/dio.dart';
import 'package:unit_test_project/api/api.dart';
import 'package:unit_test_project/config/header_get.dart';
import 'package:unit_test_project/model/project_model.dart';

Future<List<ProjecModel>> getProject() async {
  Dio dio = Dio();

  Response response = await dio.get(
      "https://projects-management-system.onrender.com/api/v1/projects",
      options: getHeaders());
  List<ProjecModel> projects = List.generate(response.data.length,
      (index) => ProjecModel.fromMap(response.data[index]));
  return projects;
}


