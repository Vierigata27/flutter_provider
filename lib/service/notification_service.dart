import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void>init() async {
    //initialize setting
    //is Android
    AndroidInitializationSettings andro = AndroidInitializationSettings('@mipmap/ic_launcher');

    //is IOS
    DarwinInitializationSettings ios = DarwinInitializationSettings();

    InitializationSettings initialSetting = InitializationSettings(
      android: andro,
      iOS: ios,
    );

    await flutterLocalNotificationsPlugin.initialize(initialSetting);

    //request permission IOS
    await flutterLocalNotificationsPlugin.
    resolvePlatformSpecificImplementation
    <IOSFlutterLocalNotificationsPlugin>()?.
    requestPermissions(alert: true, badge: true, sound: true);

    //request permission andoid
    await flutterLocalNotificationsPlugin.
    resolvePlatformSpecificImplementation
    <AndroidFlutterLocalNotificationsPlugin>()?.
    requestNotificationsPermission();
  }

  Future<void> showNotifivation (
    {
      required int id,
      required String title,
      required String desc,
    }
  )async{
    //andoid seting 
    final AndroidNotificationDetails androidNotificationDetails = 
    AndroidNotificationDetails(
      'channel_id', 
      'Channel Name', 
      channelDescription: 'Channel Deskripsi', 
      importance: Importance.high
      );

    //IOS Setting
    final DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails();

    final NotificationDetails nd = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(id, title, desc, nd);

  }
}