import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/splash/splash.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log("title : ${message.notification?.title}");
  log("body : ${message.notification?.body}");
  log("payload : ${message.data}");
}

class FirebaseServices {
  final firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      "high_importance_channel", "High Importance Notifications",
      description: 'This channel is used for important notifications',
      importance: Importance.max);
  final localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("fcmToken", fcmToken.toString());
    log("fcmToken  :  ${sharedPreferences.getString(
          "fcmToken",
        ).toString()}");
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifcations();
    initLocalNotifictions();
  }

  void handleMassage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
    Get.to(const SplashScreen());
  }

  Future initLocalNotifictions() async {
    // const ios = IOSInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(
      android: android,
    );
    await localNotifications.initialize(
      settings,
    );
    final platform = localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifcations() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.getInitialMessage().then(handleMassage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMassage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker',
            ),
          ),
          payload: jsonEncode(message.toMap()));
    });
  }
}
