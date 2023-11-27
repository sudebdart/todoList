import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Style/style.dart';
import '../../Api/apiClient.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool isShowLoader = false;
  Map<String, String> FormValues = {"email": "", "password": ""};

  inputOnChange(inputKey, inputValue) {
    setState(() {
      FormValues.update(inputKey, (value) => inputValue);
    });
  }

  formOnSubmit() async {
    if (FormValues["email"]!.length == 0) {
      ErrorToast("Email required");
    } else if (FormValues["password"]!.length == 0) {
      ErrorToast("Password required");
    } else {
      // setState(() {
      //   isShowLoader = true;
      // });
      bool isLogedIn = await LoginRequest(FormValues);
      print(isLogedIn);
      if (isLogedIn == true) {
        setState(() {
          isShowLoader = false;
        });
        SuccessToast("Login successfull");
        // Navigator.pushNamedAndRemoveUntil(
        //     context, "/registration", (route) => false);
      } else {
        ErrorToast("Login Failed");
        setState(() {
          isShowLoader = false;
        });
      }
    }
  }

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
                  "Sign In",
                  style: Head1Text(colorLightGray),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Please enter username and password details",
                    style: Head6Text(colorLightGray),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Email"),
                  onChanged: (value) {
                    inputOnChange("email", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Password"),
                  onChanged: (value) {
                    inputOnChange("password", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild("Sign In"),
                  onPressed: () {
                    formOnSubmit();
                  },
                ))
              ]),
        ),
        isShowLoader ? loaderView() : Container()
      ]),
    );
  }
}
