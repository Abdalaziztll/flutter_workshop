import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final timer = useState(0);

    useEffect(() {
      Timer.periodic(Duration(seconds: 1), (t) {
        timer.value = t.tick;
      });
    }, []);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.value.toString()),
            Text(timer.value.toString())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        counter.value++;
      }),
    );
  }
}

class HookAuthStatless extends HookWidget {
  const HookAuthStatless({super.key});

  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: name,
          ),
          TextField(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(),
                    ),
                  ));
            },
            child: Text(
              "Send",
            ),
          )
        ],
      ),
    );
  }
}

class HelloWorld extends HookWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    getData() {
      return Dio()
          .get('https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people/1');
    }

    final result = useFuture(
      useMemoized(
        getData,
        ['name'],
      ),
    );
    return Scaffold(
      body: Center(
        child: Text(result.hasData
            ? result.data!.data.toString()
            : "The Data is Loading "),
      ),
    );
  }
}

class MyWidgeth extends StatelessWidget {
  MyWidgeth({super.key});

  ScrollController use = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: use,
        children: [
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          ),
          FlutterLogo(
            size: 400,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(use.position);
      }),
    );
  }
}
