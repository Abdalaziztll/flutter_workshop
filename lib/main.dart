import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_and_mocking/bloc/auth_bloc.dart';
import 'package:tdd_and_mocking/model/user_model.dart';
import 'package:tdd_and_mocking/repo/auth_repo.dart';
import 'package:tdd_and_mocking/service/auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpPage());
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepo(AuthService(Dio()))),
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Success) {
              return Center(
                child: Text("data"),
              );
            } else if (state is Failed) {
              return Text(state.message);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          context.read<AuthBloc>().add(SignUpEvent(
              user: UserModel(
                  firstName: "",
                  lastName: "",
                  phone: "",
                  username: "",
                  birthDate: "",
                  password: "",
                  confirmPassword: "")));
        }),
      ),
    );
  }
}
