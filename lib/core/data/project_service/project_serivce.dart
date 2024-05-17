import 'package:clean_serive_layer/core/header.dart';
import 'package:clean_serive_layer/core/model/error_handler/base_model.dart';
import 'package:clean_serive_layer/core/model/reesponse/projrect_response_model.dart';
import 'package:dio/dio.dart';

class Service {
  Dio dio = Dio();
  late Response response;
  String baseUrl = "https://projects-management-system.onrender.com/api/v1/";
}

abstract class ProjectService extends Service {
  Future<ResutlModel> getProject();
  Future<ResutlModel> getOneProject();
}

class ProjectServiceImp extends ProjectService {
  @override
  Future<ResutlModel> getOneProject() async {
    try {
      response = await dio.get(baseUrl + 'projects/1', options: getHeader());
      if (response.statusCode == 200) {
        ProjectResponseModel project =
            ProjectResponseModel.fromMap(response.data);
        print(project);
        return project;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return ErrorModel(message: 'The Status Code is not 200');
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message);
      return ExceptionModel(message: e.message.toString());
    }
  }

  @override
  Future<ResutlModel> getProject() async {
    response = await dio.get(baseUrl + "projects", options: getHeader());
    try {
      if (response.statusCode == 200) {
        List<ProjectResponseModel> project = List.generate(
          response.data.length,
          (index) => ProjectResponseModel.fromMap(
            response.data[index],
          ),
        );

        ListOf<ProjectResponseModel> listOfProject = ListOf(project: project);
        return listOfProject;
      } else {
        return ErrorModel(message: 'THe status Code is not 200');
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message.toString());
    }
  }
}
