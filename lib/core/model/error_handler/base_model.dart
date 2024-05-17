// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_serive_layer/core/model/reesponse/projrect_response_model.dart';

class ResutlModel {}

class ErrorModel extends ResutlModel {
  String message;
  ErrorModel({
    required this.message,
  });
}

class ExceptionModel extends ResutlModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}

class ListOf<T extends ResutlModel> extends ResutlModel {
  List<T> project;
  ListOf({
    required this.project,
  });
  
}
