// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String firstName;
  String lastName;
  String username;
  String phone;
  String password;
  String confirmPassword;
  String birthDate;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.birthDate,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? phone,
    String? password,
    String? confirmPassword,
    String? birthDate,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
      'birthDate': birthDate,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      username: map['username'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      birthDate: map['birthDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, username: $username, phone: $phone, password: $password, confirmPassword: $confirmPassword, birthDate: $birthDate)';
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        username,
        phone,
        password,
        confirmPassword,
        birthDate
      ];
}
