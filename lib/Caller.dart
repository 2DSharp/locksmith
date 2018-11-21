import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:core';
import 'package:flutter_webrtc/webrtc.dart';
import 'signaling.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CallSample extends StatefulWidget {
  CallSample();

  @override
  _CallSampleState createState() => new _CallSampleState();
}

class _CallSampleState extends State<CallSample> {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _CallSampleState();

  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
  }
  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){
      print("id: "+token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }

  initRenderers() async {
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold();
  }
}
