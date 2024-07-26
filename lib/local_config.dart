
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    final InitializationSettings settings =const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static void onTap(NotificationResponse notificationResponse) {
  }

  static Future<void> showBasicNotification({
    required String channelId,
    required String title,
    required String body,
  }) async {
    final NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        'id3',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      details,
      payload: 'payloadData',
    );
  }

  static Future<void> showBasicNotificationWhenAnswer() async {
    await showBasicNotification(
      channelId: 'id1',
      title: 'شكراً لمساهمتك',
      body: 'نقدّر جهودك',
    );
  }

  static Future<void> showBasicNotificationWhenAddForm() async {
    await showBasicNotification(
      channelId: 'id2',
      title: 'لقد تم إضافة فورم جديد',
      body: 'يرجى الإجابة عنه',
    );
  }
}
