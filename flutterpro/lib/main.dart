// Based on https://dartpad.dev/?id=d57c6c898dabb8c6fb41018588b8cf73
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutterpro/Screen/onboarding/emailVarifectionScreen.dart';
import 'package:flutterpro/Screen/onboarding/loginScreen.dart';
import 'package:flutterpro/Screen/onboarding/pinScreenScreen.dart';
import 'package:flutterpro/Screen/onboarding/registrationScreen.dart';
import 'package:flutterpro/Screen/onboarding/setPasswordScreen.dart';
import 'package:flutterpro/Screen/onboarding/splashScreen.dart';
import 'package:flutterpro/screen/task/createTaskScreen.dart';
import 'package:flutterpro/screen/task/newTaskList.dart';
import 'package:flutterpro/screen/task/homeScreen.dart';
import 'package:flutterpro/utility/utility.dart';
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData("token");
  print("$token");
  if (token == null) {
    runApp(MyApp("/login"));
  } else{
    runApp(MyApp("/homeScreen"));
  }
}

class MyApp extends StatelessWidget {
   final String FirstRoute ;
   MyApp(this.FirstRoute);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: '$FirstRoute',
      routes: {
        '/splash': (context) => splashScreen(),
        '/login': (context) => loginScreen(),
        '/registration': (context) => registrationScreen(),
        '/pinVerication': (context) => pinVerificationScreen(),
        '/emailVerification': (context) => emailVerificationScreen(),
        '/setPassword': (context) => setPasswordScreen(),
        '/newTaskList': (context) => newTaskList(),
        '/homeScreen': (context) => homeScreen(),
        '/taskCreate': (context) => createTaskScreen(),
      },
    );
  }
}
