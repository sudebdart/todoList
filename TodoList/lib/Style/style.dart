import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);
const colororange = Color.fromRGBO(230, 126, 34, 1.0);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1.0);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);
const colorLight = Color.fromRGBO(211, 211, 211, 1.0);
const colorMagenta = Color(0xff290102);
const colorLoader = Color(0x33574f4f);

//rgba(255, 0, 0, 0.2);

TextStyle Head1Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 28,
    //fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle Head6Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 16,
      //fontFamily: 'poppins',
      fontWeight: FontWeight.w400);
}

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: colorGreen, width: 1),
      ), // OutlineInputBorder
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: colorWhite, width: 0.0),
      ), // OutlineInputBorder
      border: OutlineInputBorder(),
      labelText: label); // InputDecoration
}

Ink SuccessButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(
        color: colorGreen, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: ButtonTextStyle(),
      ),
    ), // Container
  ); // Ink
}

TextStyle ButtonTextStyle() {
  return TextStyle(
      fontSize: 14, fontFamily: 'poppins fontWeight: FontWeight.w400');
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}

SvgPicture ScreenBackground(context) {
  return SvgPicture.asset(
    'assets/images/background.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

PinTheme AppOTPStyle() {
  return PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    activeColor: colorWhite,
    selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white,
  ); // PinTheme
}

void SuccessToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0);
}

void ErrorToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0);
}

Widget loaderView() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    alignment: Alignment.center,
    color: colorLoader,
    child: CircularProgressIndicator(
      backgroundColor: Colors.lightBlue,
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 4,
    ),
  );
}
