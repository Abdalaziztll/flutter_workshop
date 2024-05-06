// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:unit_test_project/bloc/app_bloc.dart';
import 'package:unit_test_project/login/bloc/login_bloc.dart';

void main() {
  // await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
        home: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is HeSigendUp) {
              return HomePage();
            } else {
              return SignUp();
            }
          },
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: firstName,
              ),
              TextField(
                controller: lastName,
              ),
              TextField(
                controller: email,
              ),
              TextField(
                controller: password,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is Success) {
                    context.read<AppBloc>().add(SigendUp());
                  }
                },
                child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(SigningUp(
                          user: SignUpInfo(
                              firstName: firstName.text,
                              lastName: lastName.text,
                              email: email.text,
                              password: password.text,
                              role: "USER")));
                    },
                    child: Text("data")),
              )
            ],
          ),
        );
      }),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class SignUpInfo {
  String firstName;
  String lastName;
  String email;
  String password;
  String role = "USER";
  SignUpInfo({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.role,
  });

  SignUpInfo copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? role,
  }) {
    return SignUpInfo(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory SignUpInfo.fromMap(Map<String, dynamic> map) {
    return SignUpInfo(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpInfo.fromJson(String source) =>
      SignUpInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpInfo(firstName: $firstName, lastName: $lastName, email: $email, password: $password, role: $role)';
  }

  @override
  bool operator ==(covariant SignUpInfo other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        role.hashCode;
  }
}
