import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:unit_test_project/graphql/remote/get_data.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: InkWell(
              key: ValueKey('inkwell'),
              onTap: () {
                print("Hello Wolrd");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.toString());
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  FutureBuilder(
                    future: getDataFromRest(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.toString());
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}

getDataFromRest() async {
  Dio dio = Dio();
  dynamic response =
      await dio.get("https://jsonplaceholder.typicode.com/comments/1");

  return response;
}
