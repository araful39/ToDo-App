import 'package:flutter/material.dart';
import 'package:hive_practce/util/dialoge_box.dart';
import 'package:hive_practce/util/tode_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescreptionController = TextEditingController();
  // list of todo tasks
  List toDoList = [
    ["123456", "Make a tutorial", false]
  ];
  //chekcbox was tapped
  void CheckboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][2] = !toDoList[index][2];
    });
  }

  // onSave
  void onSavebutton() {
    setState(() {
      toDoList.add(
          [_taskNameController.text, _taskDescreptionController.text, false]);
    });
    Navigator.pop(context);
    _taskNameController.clear();
    _taskDescreptionController.clear();
  }

  // onCancel
  void OnCancel() {
    Navigator.pop(context);
  }

  // create a new task
  void createNewTask() {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return DialogeBox(
              phoneController: _taskNameController,
              taskController: _taskDescreptionController,
              onSave: onSavebutton,
              onCancel: OnCancel,
            );
          });
    } catch (exeption) {
      print(exeption);
    }
  }
  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text("TO DO"),
          elevation: 0,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: toDoList[index][0],
                taskDescreption: toDoList[index][1],
                taskCompleted: toDoList[index][2],
                onChanged: (value) => CheckboxChanged(value, index),
                deleteFunction:(context)=>deleteTask(index),
              );
            }));
  }
}
