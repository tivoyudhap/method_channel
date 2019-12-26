import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {

  static const platform = const MethodChannel('com.tivoyudha.method_channel_app.channel');

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Call native code"),
              onPressed: _showNativeView,
            )
          ],
        ),
      )
    );
  }

  Future<Null> _showNativeView() async {
    await HomeScreen.platform.invokeMethod('showNativeView');
  }
}