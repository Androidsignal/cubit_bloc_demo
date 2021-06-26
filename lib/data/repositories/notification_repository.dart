import 'dart:convert';

import 'package:bloc_pattern_demo/data/models/notification.dart';
import 'package:flutter/services.dart';

abstract class NotificationRepository {
  Future<List<NotificationModel>?> getNotifications();
}

class NotificationApi implements NotificationRepository{
  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      String data = await rootBundle.loadString('images/notification.json');
      Map body = jsonDecode(data);
      String message = body['message']??'';
      if(body['result'] == 'success' && body['data'] is List){
        List  list = body['data'];
        var notificationList = list.map((e) => NotificationModel.fromMap(e)).toList();
        return notificationList;
      }else{
        throw UnimplementedError(message);
      }
    } on Exception catch (e) {
      throw UnimplementedError('Exception at getNotifications: '+e.toString());
    }
  }
}