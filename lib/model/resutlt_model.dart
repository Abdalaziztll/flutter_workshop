// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultModel {}

class TokenModel extends ResultModel{
  String token;
  TokenModel({
    required this.token,
  });
}

class ErrorModel extends ResultModel {
  String error;
  ErrorModel({
    required this.error,
  });
}
