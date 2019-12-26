import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:method_channel_app/src/HomeScreen.dart';
import 'package:method_channel_app/src/bloc/SplashScreenBloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  static const platform = const MethodChannel('com.tivoyudha.method_channel_app.channel');
  
  SplashScreenBloc _splashScreenBloc = new SplashScreenBloc();

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_handleMethod);
  }
  
  @override
  Widget build(BuildContext context) {
    _splashScreenBloc.countDownTimer(3, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Image.asset('assets/image/ic_flutter.png', height: 200, width: 200),
      ),
    );
  }

  Future<dynamic> _handleMethod(MethodCall methodCall) async {
    switch(methodCall.method) {
      case "sendMessage":
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(methodCall.arguments)));
    }
  }
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();