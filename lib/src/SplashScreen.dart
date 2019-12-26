import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:method_channel_app/src/HomeScreen.dart';
import 'package:method_channel_app/src/bloc/SplashScreenBloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  
  SplashScreenBloc _splashScreenBloc = new SplashScreenBloc();
  
  @override
  Widget build(BuildContext context) {
    _splashScreenBloc.countDownTimer(3, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image/ic_flutter.png', height: 200, width: 200),
      ),
    );
  }
}