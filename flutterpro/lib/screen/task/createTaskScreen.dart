import 'package:flutter/material.dart';
import 'package:flutterpro/Style/style.dart';
import 'package:flutterpro/api/apiClient.dart';

class createTaskScreen extends StatefulWidget {
  const createTaskScreen({Key? key}) : super(key: key);

  @override
  State<createTaskScreen> createState() => _createTaskScreenState();
}

class _createTaskScreenState extends State<createTaskScreen> {

  Map<String,String> FormValues = {"title":"","description":"","status":"New"} ;
  var isLoading = false ;

  inputOnChange(key,txtValue) {
    setState(() {
      FormValues.update(key, (value) => txtValue);
    });
  }

  formOnSubmit() async {
    if (FormValues["title"]!.length == 0) {
      ErrorToast("Title required");
    } else if (FormValues["description"]!.length == 0) {
      ErrorToast("Description required");
    } else {
      setState(() {
        isLoading = true;
      });
      bool isCreatedTask = await CreateTaskListRequest(FormValues) ;
      print(isCreatedTask);
      if (isCreatedTask == true) {
        setState(() {
          isLoading = false;
        });
        SuccessToast("Task successfully Added");
        Navigator.pushNamedAndRemoveUntil(context, "/homeScreen", (route) => false);
      } else {
        ErrorToast("Login Failed");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Task"),backgroundColor: colorGreen,),
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
                  "Add new task",
                  style: Head1Text(colorLightGray),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Task Name"),
                  onChanged: (value) {
                    inputOnChange("title", value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Info"),
                  maxLines: 10,
                  onChanged: (value) {
                    inputOnChange("description", value);
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
        isLoading ? loaderView() : Container()
      ]),
    );
  }
}
