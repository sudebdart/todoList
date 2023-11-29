import 'package:flutter/material.dart';
import 'package:flutterpro/api/apiClient.dart';
import 'package:flutterpro/screen/components/TaskListView.dart';
import '../../Style/style.dart';
class newTaskList extends StatefulWidget {
  const newTaskList({Key? key}) : super(key: key);

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  var isShowLoading = false;
  var Status = "New";
  List TaskItems = [];

  FetchNewTaskLists() async {
    setState(() {
      isShowLoading = true;
    });
    var data = await TaskListRequest("New");
    print(data);
    setState(() {
      isShowLoading = false;
      TaskItems = data;
     });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  isShowLoading = true;
                });
                await DeleteTaskListRequest(id);
                await FetchNewTaskLists();
              }, child: Text('Yes')), // OutlinedButton
              OutlinedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('No')), // OutlinedButton
            ],
          ); // AlertDialog
        }
    );
  }

  StatusChange(id) async {
    showModalBottomSheet(context: context,
        builder: (context) {
      return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
        return Container(
          padding: EdgeInsets.all(30),
          height: 360,
          child: Column(
             children: [
               RadioListTile(title: Text("New"),value: "New",groupValue: Status,
                 onChanged: (value){
                 setState((){Status = value.toString();});
                 },
               ),
               RadioListTile(title: Text("Progress"),value: "Progress",groupValue: Status,
                 onChanged: (value){
                   setState((){Status = value.toString();});
                 },
               ),
               RadioListTile(title: Text("Completed"),value: "Completed",groupValue: Status,
                 onChanged: (value){
                   setState((){Status = value.toString();});
                 },
               ),
               RadioListTile(title: Text("Cancel"),value: "Cancel",groupValue: Status,
                 onChanged: (value){ setState((){Status = value.toString();});},
               ),
               Container(
                 child: ElevatedButton(
                   style: AppButtonStyle(),
                   child: SuccessButtonChild('Confirm'),
                   onPressed: () async{
                     Navigator.pop(context);
                     setState((){ isShowLoading = true ;});
                     await UpdateTaskListRequest(id, Status);
                     await FetchNewTaskLists();
                     setState((){ isShowLoading = false ;
                     Status = "New";
                     });
                   },
                 ),
               )
             ]
          ),
        );
      }
      );
    }
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchNewTaskLists();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          isShowLoading
              ? loaderView()
              : RefreshIndicator(
            onRefresh: () async {
              await FetchNewTaskLists();
            },
            child: TaskList(TaskItems,DeleteItem,StatusChange),
          ),
        ],
      );
  }
}
