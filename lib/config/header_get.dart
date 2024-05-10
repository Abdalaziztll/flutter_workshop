import 'package:dio/dio.dart';

getHeaders() {
  return Options(headers: {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHIzMjFpbmciLCJpYXQiOjE3MTUzNDkzNjEsImV4cCI6MTcxNTM1MDgwMX0.y5LgwiyQI_hCtBvaESOh8QDQhuD16xPOAo1HGeINYbE"
  });
}
