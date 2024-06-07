import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_and_init_careem/bloc/animal_bloc.dart';
import 'package:mock_and_init_careem/bloc/auth_bloc.dart';
import 'package:mock_and_init_careem/model/handling.dart';
import 'package:mock_and_init_careem/model/user_model.dart';
import 'package:mock_and_init_careem/service/mock/face_product.dart';
import 'package:mock_and_init_careem/service/real/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimalPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

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
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text("Success"),
                          ),
                        );
                      case AuthInitial():
                        return ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    Login(
                                      user: UserModel(
                                          name: name.text, email: email.text),
                                    ),
                                  );
                            },
                            child: Text("Send"));
                      case Error():
                        return Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text("Error Try Again"),
                          ),
                        );

                      default:
                        return Center(
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
  AnimalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalBloc(),
      child: Builder(builder: (context) {
        context.read<AnimalBloc>().add(GetAnimal());
        return Scaffold(
          body: BlocBuilder<AnimalBloc, AnimalState>(
            builder: (context, state) {
              if (state is SuccessGetAnimal) {
                return ListView.builder(
                  itemCount: state.result.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.result[index].name),
                    );
                  },
                );
              } else if (state is ErrorFetchingData) {
                return Center(
                  child: Text("Error in your data"),
                );
              } else {
                return Center(
                  child: LinearProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
