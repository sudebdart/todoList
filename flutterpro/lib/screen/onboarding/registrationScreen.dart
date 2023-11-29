import 'package:flutter/material.dart';

import '../../Style/style.dart';
import '../../api/apiClient.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

  bool isShowLoader = false;
  Map<String, String> FormValues = {"email": "", "firstName": "","lastName":"","mobile":"","password":"","photo":""};

  inputOnChange(inputKey, inputValue) {
    setState(() {
      FormValues.update(inputKey, (value) => inputValue);
    });
  }

  formOnSubmit() async {
    if (FormValues["email"]!.length == 0) {
      ErrorToast("Email required");
    }else if (FormValues["firstName"]!.length == 0) {
      ErrorToast("First Name required");
    } else if (FormValues["lastName"]!.length == 0) {
      ErrorToast("Last Name required");
    } else if (FormValues["mobile"]!.length == 0) {
      ErrorToast("Mobile no required");
    } else if (FormValues["password"]!.length == 0) {
      ErrorToast("Password required");
    } else {
      setState(() {
        isShowLoader = true;
      });
      bool isLogedIn = await RegistrationRequest(FormValues);
      print(isLogedIn);
      if (isLogedIn == true) {
        setState(() {
          isShowLoader = false;
        });
        SuccessToast("Registration successful");
        Navigator.pushNamedAndRemoveUntil(
            context, "/login", (route) => false);
      } else {
        ErrorToast("Registration Failed");
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
                  onChanged: (value){
                    inputOnChange("email", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("First Name"),
                  onChanged: (value){
                    inputOnChange("firstName", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Last Name"),
                  onChanged: (value){
                    inputOnChange("lastName", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Mobile"),
                  onChanged: (value){
                    inputOnChange("mobile", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Password"),
                  onChanged: (value){
                    inputOnChange("password", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild("Sign Up"),
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
