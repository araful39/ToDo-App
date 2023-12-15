import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_practce/data/database.dart';
import 'package:hive_practce/util/dialoge_box.dart';
import 'package:hive_practce/util/tode_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box("myBox");

  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescreptionController = TextEditingController();
  //if this is the 1st time ever openin the app,then create default data
  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }
    else{
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

// toDoDataBase inistance
  ToDoDataBase db = ToDoDataBase();

  //chekcbox was tapped
  void CheckboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updataDataBase();
  }

  // onSave
  void onSavebutton() {

   if(_taskNameController.text.isNotEmpty && _taskDescreptionController.text.isNotEmpty ){
     setState(() {
       db.toDoList.add(
           [_taskNameController.text, _taskDescreptionController.text, false]);
     });
     _taskNameController.clear();
     _taskDescreptionController.clear();
     Navigator.pop(context);
     db.updataDataBase();
   }else{

 showDialog(context: context, builder: (context){
   return AlertDialog(
     content: Text("Please insert subject and descreption"),
   );
 }
       );
   }

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
              taskSubController: _taskNameController,
              taskDescreptionController: _taskDescreptionController,
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
      db.toDoList.removeAt(index);
    });
    db.updataDataBase();
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: db.toDoList[index][0],
                taskDescreption: db.toDoList[index][1],
                taskCompleted: db.toDoList[index][2],
                onChanged: (value) => CheckboxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
