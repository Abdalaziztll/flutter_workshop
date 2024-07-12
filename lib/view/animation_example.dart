import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Colors.red,
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) => FlutterLogo(
              size: 300,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(controller.position);
        },
      ),
    );
  }
}
