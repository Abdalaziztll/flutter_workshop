import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unit_test_project/bloc/auth_bloc.dart';
import 'package:unit_test_project/config/get_it.dart';
import 'package:unit_test_project/model/resutlt_model.dart';
import 'package:unit_test_project/model/signup_model.dart';
import 'package:unit_test_project/service/data.dart';
import 'package:unit_test_project/service/signup_serivce.dart';

main() {
  runApp(SingUpPage());
}

class MyApp extends StatelessWidget {
  MyApp._interanl();

  static final app = MyApp._interanl();

  factory MyApp() => app;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return config.get<StaticPage>().errorPage;
  }
}

class StaticPage {
  ErrorPage errorPage = ErrorPage();
}

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: getProject(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 317,
                      height: 105,
                      decoration: BoxDecoration(
                          //background: rgba(217, 217, 217, 1);
                          color: Color.fromARGB(222, 217, 217, 217),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data![index].name),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class SingUpPage extends StatelessWidget {
  SingUpPage({super.key});

  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FixSignPage(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password),
    );
  }
}

class FixSignPage extends StatelessWidget {
  const FixSignPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: firstName,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: lastName,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Success) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Msheee alhaaal"),
                    backgroundColor: Colors.green,
                  ));
                }
              },
              builder: (context, state) {
                if (state is AuthInitial) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              SignUpEvent(
                                user: UserSignUpModel(
                                    firstName: firstName.text,
                                    lastName: lastName.text,
                                    email: email.text,
                                    password: password.text,
                                    role: "USER"),
                              ),
                            );
                      },
                      child: Text("SignUp"));
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
