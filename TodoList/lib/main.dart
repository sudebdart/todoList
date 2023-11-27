import 'dart:developer';
import 'package:flutter/material.dart';
import 'Screen/onboarding/emailVarifectionScreen.dart';
import 'Screen/onboarding/loginScreen.dart';
import 'Screen/onboarding/pinScreenScreen.dart';
import 'Screen/onboarding/registrationScreen.dart';
import 'Screen/onboarding/setPasswordScreen.dart';
import 'Screen/onboarding/splashScreen.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

const messageLimit = 30;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreen(),
        '/login': (context) => loginScreen(),
        '/registration': (context) => registrationScreen(),
        '/pinVerication': (context) => pinVerificationScreen(),
        '/emailVerivifation': (context) => emailVerificationScreen(),
        '/setPassword': (context) => setPasswordScreen(),
      },
    );
  }
}