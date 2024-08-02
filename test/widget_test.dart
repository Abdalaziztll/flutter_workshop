// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_and_mocking/model/base_model.dart';
import 'package:tdd_and_mocking/model/error/expeptions.dart';
import 'package:tdd_and_mocking/model/failed_model.dart';
import 'package:tdd_and_mocking/model/user_model.dart';
import 'package:tdd_and_mocking/repo/auth_repo.dart';
import 'package:tdd_and_mocking/service/auth_service.dart';

class ServiceMock extends Mock implements AuthService {}

class RepoMock extends Mock implements AuthRepo {}

void main() {
  test('testing toMap method in userModel', () {
    UserModel user = UserModel(
        firstName: "string",
        lastName: "string",
        phone: "stringstri",
        username: "string",
        birthDate: "2024-08-02",
        password: "string",
        confirmPassword: "string");

    expect(user.toMap(), {
      "firstName": "string",
      "lastName": "string",
      "phone": "stringstri",
      "username": "string",
      "birthDate": "2024-08-02",
      "password": "string",
      "confirmPassword": "string"
    });
  });

  test("empty strings in toMap userModel", () {
    UserModel user = UserModel(
        firstName: "",
        lastName: "",
        phone: "",
        username: "",
        birthDate: "",
        password: "",
        confirmPassword: "");

    expect(user.toMap(), {
      "firstName": "",
      "lastName": "",
      "phone": "",
      "username": "",
      "birthDate": "",
      "password": "",
      "confirmPassword": ""
    });
  });

  group("test of service layer", () {
    late Dio dio;
    late UserModel user;

    setUp(() {
      dio = Dio();
      user = UserModel(
          firstName: "firstName",
          lastName: "lastName",
          phone: "0930129945",
          username: "usenjjesa",
          birthDate: "2024-08-02",
          password: "sjdhak32132@#!#@S",
          confirmPassword: "sjdhak32132@#!#@S");
    });
    test("Integraty model with happy service scienaro", () async {
      AuthService service = AuthService(dio);
      Response response = await service.signUp(user);
      expect(response, isA<Response>());
    });

    setUp(() {
      dio = Dio();
      user = UserModel(
          firstName: "firstName",
          lastName: "lastName",
          phone: "0930129945",
          username: "usenjjesa",
          birthDate: "2024-08-02",
          password: "sjdhak32132@#!#@S",
          confirmPassword: "sjdhak32132@#!#@S");
    });

    test("Integraty model with happy service scienaro", () async {
      AuthService service = AuthService(dio);
      Response response = await service.signUp(user);
      expect(response, isA<Response>());
    });
  });

  group("test repos ", () {
    late Dio dio;
    late UserModel user;
    late AuthService service;
    late AuthRepo repo;

    setUp(() {
      user = UserModel(
          firstName: "",
          lastName: "",
          phone: "",
          username: "",
          birthDate: "",
          password: "",
          confirmPassword: "");
      dio = Dio();
      service = AuthService(dio);
      repo = AuthRepo(service);
    });
    test("test bad scenario", () async {
      DataModel data = await repo.signup(user);
      expect(data, isA<DataFailed>());
    });
  });

  test("simple mock test", () {
    ServiceMock serviceMock = ServiceMock();
    RepoMock repoMock = RepoMock();


    when(serviceMock.signUp(UserModel(
          firstName: "",
          lastName: "",
          phone: "",
          username: "",
          birthDate: "",
          password: "",
          confirmPassword: ""))).thenThrow(() {
      throw UsedUserNameBefore();

      
    });
  });
}
