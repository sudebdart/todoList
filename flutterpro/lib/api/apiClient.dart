import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Style/style.dart';
import '../utility/utility.dart';

var BaseURL = "https://task.teamrabbil.com/api/v1";
var RequestHeader = {"Content-Type": "application/json"};

Future<bool> LoginRequest(FormValues) async {
  var URL = Uri.parse("${BaseURL}/login");
  var PostBody = json.encode(FormValues);
  var response = await http.post(URL, headers: RequestHeader, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  print(ResultCode);
  print(ResultBody);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    await StoreUserData(ResultBody);
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> RegistrationRequest(FormValues) async {
  var URL = Uri.parse("${BaseURL}/registration");
  var PostBody = json.encode(FormValues);
  var response = await http.post(URL, headers: RequestHeader, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> VerifyOTPRequest(Email, OTP) async {
  var URL = Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");
  var response = await http.get(URL, headers: RequestHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> SetPasswordRequest(FormValues) async {
  var URL = Uri.parse("${BaseURL}/RecoverResetPass");
  var PostBody = json.encode(FormValues);
  var response = await http.post(URL, headers: RequestHeader, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}


Future<List> TaskListRequest(status) async {
  var URL = Uri.parse("${BaseURL}/listTaskByStatus/${status}");
  String? token = await ReadUserData("token");
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDA5OTQ0NjEsImRhdGEiOiJyYWJiaWxAZ21haWwuY29tIiwiaWF0IjoxNzAwOTA4MDYxfQ.rjgenBtybPHGjxHnwgUk9tMoDWQYCZmtAgVRCfp0vVM"; //ReadUserData("token");
  var requestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await http.get(URL, headers: requestHeaderWithToken);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    print(ResultBody);
    return ResultBody['data'];
  } else {
    ErrorToast("Request fail ! try again");
    return [];
  }
}

Future<bool> CreateTaskListRequest(FormValues) async {
  var URL = Uri.parse("${BaseURL}/createTask");
  var PostBody = json.encode(FormValues);
  String? token = await ReadUserData("token");
  var requestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await http.post(URL, headers: requestHeaderWithToken, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> DeleteTaskListRequest(id) async {
  var URL = Uri.parse("${BaseURL}/deleteTask/${id}");
  String? token = await ReadUserData("token");
  var requestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await http.get(URL, headers: requestHeaderWithToken);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Task deleted successfully");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> UpdateTaskListRequest(id,status) async {
  var URL = Uri.parse("${BaseURL}/updateTaskStatus/${id}/${status}");
  String? token = await ReadUserData("token");
  var requestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await http.get(URL, headers: requestHeaderWithToken);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Task updated successfully");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}