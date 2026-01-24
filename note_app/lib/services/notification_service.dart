import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notifications.initialize(initializationSettings);
  }

  static Future<void> showNoteAdded(String title) async {
    const androidDetails = AndroidNotificationDetails(
      'notes_channel',
      'Notes',
      channelDescription: 'Notifications for notes',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await _notifications.show(
      0,
      'Note saved',
      title.isEmpty ? 'Your note was added' : title,
      notificationDetails,
    );
  }
}
