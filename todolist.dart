import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoView extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Todo List"),actions:[IconButton(onPressed: (){}, icon: Icon(Icons.add))]),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          //margin: EdgeInsets.all(10),
          //padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column (
            children: [
              myList("Exercise",Colors.redAccent),
              myList("Brushing",Colors.redAccent),
              myList("Breakfast",Colors.orange),
              myList("Coocking",Colors.greenAccent),
            ],
          )
        ),
      )
    );


  Container myList(String todoItems, Color priority){
      return Container(
        child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.radio_button_unchecked),color: Colors.grey,),
              Text(todoItems,style: TextStyle(color: Colors.black),),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.circle),color: priority,iconSize: 15 ,)
            ]
        )
    ) ;
  }

}