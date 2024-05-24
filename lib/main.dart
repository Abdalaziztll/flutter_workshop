import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test_concept/config/check_connect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) => CheckConnect().connection.stream,
          initialData: Status.online,
        )
      ],
      child: MaterialApp(
        home: AppScaffold(
          child: Center(
              child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
          )),
        ),
      ),
    );
  }
}

class AppScaffold extends StatelessWidget {
  AppScaffold({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    var connection = Provider.of<Status>(context);

    return Scaffold(
        body: (connection == Status.offline)
            ? Container(
                child: Center(
                  child: Text("THere is no internet"),
                ),
              )
            : child);
  }
}
