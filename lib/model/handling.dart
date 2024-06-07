// ignore_for_file: public_member_api_docs, sort_constructors_first

class ResultModel {}

class SuccessModel extends ResultModel {}

class ErrorModel extends ResultModel {
  String messge;
  ErrorModel({
    required this.messge,
  });
}

class ExceptionModel extends ResultModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}

class ListOf<T>  extends ResultModel{
  List<T> resutl;
  ListOf({
    required this.resutl,
  });
}
