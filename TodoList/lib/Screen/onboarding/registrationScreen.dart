import 'package:flutter/material.dart';

import '../../Style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ScreenBackground(context),
        Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: double.infinity,
          color: Color(0xfff6f1f1),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Join with Us",
                  style: Head1Text(colorLightGray),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Please enter the details",
                    style: Head6Text(colorLightGray),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Email"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("First Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Last Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Mobile"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild("Sign Up"),
                  onPressed: () {},
                ))
              ]),
        )
      ]),
    );
  }
}
