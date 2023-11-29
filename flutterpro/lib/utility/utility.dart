import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> StoreUserData(UserData) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['token']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('firstName', UserData['data']['firstName']);
  await prefs.setString('lastName', UserData[ 'data']['lastName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']);
}

Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata = await prefs.getString(Key);
  return mydata;
}

Future<bool> RemoveToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("token");
  return true;
}

ShowBase64Image(Base64String) {
  UriData? data = Uri.parse(Base64String).data ;
  Uint8List myImg = data!.contentAsBytes();
  return myImg;
}
