import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_proj/keys/one_signal_keys.dart';

class NotificationServices {
  String url = "https://onesignal.com/api/v1/notifications";

  sendNotification(String title, String description ,String id) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "key ${OneSignalKeys.restAppKey}",
          "Content-Type": " application/json",
        },
        body: jsonEncode({
          "app_id": OneSignalKeys.appKey,
          "contents": {"en": description},
          "headings": {"en": title},
          "included_segments":null,
          "include_external_user_ids": [id],
          "small_icon": "@mipmap/ic_launcher",
        }),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(
            "The message sent successfully and the message is ${response.body}",
          );
        }
      } else {
        if (kDebugMode) {
          print(
            "The message sent failed and the exception is ${response.statusCode} and the message is ${response.statusCode}",
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("The exception in this is:$e");
      }
    }
  }
}
