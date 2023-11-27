import 'dart:async';

import 'package:flutter/material.dart';
import '../../Screen/onboarding/loginScreen.dart';
import '../../Style/style.dart';

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
