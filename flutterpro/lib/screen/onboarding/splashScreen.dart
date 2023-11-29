import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterpro/Screen/onboarding/loginScreen.dart';
import 'package:flutterpro/Style/style.dart';
import 'package:flutterpro/utility/utility.dart';
class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ScreenBackground(context),
        Center(
          child: Text("Todo list", style: Head1Text(colorMagenta)),
        )
      ],
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    ReadUserData("email");

  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => loginScreen()));
  }
}
