// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:deep_div/bloc/bird_bloc.dart';
import 'package:deep_div/bloc/counter_bloc.dart';
import 'package:deep_div/obser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:deep_div/bloc/auth_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocObserver bloc = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  A a = A();

  a.name.add("value");

  A b = A();

  print(b.name);
  runApp(MyApp());
}

class A {
  List<String> name = [];
  A();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController username = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (con) => BlocProvider.value(
                          value: context.read<AuthBloc>(),
                          child: TempPage(),
                        ),
                      ));
                },
                child: Text("Go")),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
                      controller: phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
                      controller: firstName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
                      controller: lastName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
                      controller: birthDate,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(onPressed: () {
                  context.read<AuthBloc>().add(FirstStep(
                      firstName: firstName.text,
                      lastName: lastName.text,
                      username: username.text,
                      phone: phone.text,
                      birthDate: birthDate.text));
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class TempPage extends StatelessWidget {
  TempPage({super.key});
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                    controller: confirmPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              FloatingActionButton(onPressed: () {
                context.read<AuthBloc>().add(SecondStep(
                    password: password.text,
                    confirmPassword: confirmPassword.text));

                context.read<AuthBloc>().add(Login());
              }),
            ],
          ),
        ),
      );
    });
  }
}

class NonBlocPage extends StatelessWidget {
  const NonBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BirdPage(),
            ));
      }),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: FloatingActionButton(onPressed: () {
              context.read<CounterBloc>().add(Increament());
            }),
          ),
        );
      }),
    );
  }
}

class BirdPage extends StatelessWidget {
  const BirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BirdBloc()..add(GetOneBird()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<BirdBloc, BirdState>(
            builder: (context, state) {
              if (state is SuccessToGetBird) {
                return Column(
                  children: [
                    Image.network(state.birdModel.image),
                    ListTile(
                      title: Text(state.birdModel.name),
                      subtitle: Text(state.birdModel.family),
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
