import 'package:flutter/material.dart';
import 'package:notification_map_tdd/local_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LocalNotificationService.showBasicNotificationWhenAnswer();
            },
            icon: Icon(Icons.notification_add),
          ),
        ],
      ),
    );
  }
}
