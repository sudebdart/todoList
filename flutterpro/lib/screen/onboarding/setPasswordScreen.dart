import 'package:flutter/material.dart';

import '../../Style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({Key? key}) : super(key: key);

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ScreenBackground(context),
        Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: double.infinity,
          //color: Color(0xfff6f1f1),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Set Password",
                  style: Head1Text(colorLightGray),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Minimum 8 character password needed with letter and number combination",
                    style: Head6Text(colorLightGray),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Confirm Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild("Confirm"),
                  onPressed: () {},
                ))
              ]),
        )
      ]),
    );
  }
}
