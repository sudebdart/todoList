import 'package:flutter/material.dart';
import 'package:flutterpro/screen/task/cancelTaskList.dart';
import 'package:flutterpro/screen/task/completedTaskList.dart';
import 'package:flutterpro/screen/task/newTaskList.dart';
import 'package:flutterpro/screen/task/progressTaskList.dart';
import 'package:flutterpro/screen/components/BottomNavigationBar.dart';

import '../../utility/utility.dart';
import '../components/TaskAppBar.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  @override
  var index = 0;
  final widgetOptions = [
    newTaskList(),
    progressTaskList(),
    completedtaskList(),
    cancelTaskList(),
  ];

  onSelectTabBar(currentSelection) {
    setState(() {
      index = currentSelection;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TaskAppBar(context),
        bottomNavigationBar: navBar(index, onSelectTabBar),
        body: widgetOptions[index]);
  }
}
