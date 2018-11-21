import 'package:flutter_native_web/flutterwebview.dart';
import 'package:flutter/material.dart';

class LiveStream extends StatelessWidget {
  static String label = "LiveStream";

  String html = '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!';
  WebController webController;


  @override
  Widget build(BuildContext context) {
    void onWebCreated(webController) {
      this.webController = webController;
      this.webController.loadUrl("https://");
      this.webController.onPageStarted.listen((url) =>
          print("Loading $url")
      );
      this.webController.onPageFinished.listen((url) =>
          print("Finished loading $url")
      );
    }

    FlutterWebView flutterWebView = new FlutterWebView(
      onWebCreated: onWebCreated,
    );

    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Plugin example app'),
            ),
            body: new Container(
              child: flutterWebView,
              height: 300.0,
              width: 500.0,
            )
        ) // ignore: expected_token
    );
  }




}