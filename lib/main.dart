import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_and_init_careem/bloc/auth_bloc.dart';
import 'package:mock_and_init_careem/bloc/animal_bloc.dart';
import 'package:mock_and_init_careem/model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    switch (state) {
                      case SuccessToLogin():
                        return Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Success",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      case AuthInitial():
                        return ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  Login(
                                    user: UserModel(
                                      name: name.text,
                                      email: email.text,
                                    ),
                                  ),
                                );
                          },
                          child: const Text(
                            "Send",
                          ),
                        );
                      case Error():
                        return Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "Error Try Again",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );

                      default:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AnimalPage extends StatelessWidget {
  const AnimalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalBloc(),
      child: Builder(
        builder: (context) {
          context.read<AnimalBloc>().add(GetAnimal());
          return Scaffold(
            body: BlocBuilder<AnimalBloc, AnimalState>(
              builder: (context, state) {
                switch (state) {
                  case ErrorFetchingData():
                    return const Center(
                      child: Text(
                        'There is an Error',
                      ),
                    );
                  case LoadingFetching():
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
                  default:
                    return ListView.builder(
                      itemCount: (state as SuccessGetAnimal).result.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.result[index].name),
                        );
                      },
                    );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
