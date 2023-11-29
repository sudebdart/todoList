import 'package:flutter/material.dart';
import 'package:flutterpro/style/style.dart';

ListView TaskList(TaskItems,DeleteItem,StatusChange) {
  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ItemSizeBox(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TaskItems[index]['title'],style: Head6Text(colorBlue),textAlign: TextAlign.left,),
                Text(TaskItems[index]['description'],style: Head7Text(colorDarkBlue),textAlign: TextAlign.left,),
                Text(TaskItems[index]['createdDate'],style: Head7Text(colorDarkBlue),textAlign: TextAlign.left,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatusChild(TaskItems[index]['status'], colorBlue),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 50,height: 30,child: ElevatedButton(onPressed: (){
                            StatusChange(TaskItems[index]['_id']);
                          }, child: Icon(Icons.edit_note_outlined),style: AppStatusButtonStyle(colorBlue),),),
                          SizedBox(width: 10,),
                          SizedBox(width: 50,height: 30,child: ElevatedButton(onPressed: (){
                            DeleteItem(TaskItems[index]['_id']);
                          }, child: Icon(Icons.delete_outline),style: AppStatusButtonStyle(colorRed),),)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        );
  });
}
