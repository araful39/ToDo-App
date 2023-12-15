import 'package:flutter/material.dart';
import 'package:hive_practce/util/dialoge_box.dart';
import 'package:hive_practce/util/tode_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller=TextEditingController();
  // list of todo tasks
  List toDoList = [
    ["Make tutorial", false],
    ["Do Exerccise", false],
    ["Make tutorial", false],
    ["Do Exerccise", false],
  ];
  //chekcbox was tapped
  void CheckboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  // onSave
  void onSavebutton(){
   setState(() {
     toDoList.add([_controller.text,false]);
   });
    Navigator.pop(context);
    _controller.clear();
  }
  // onCancel
  void OnCancel(){
    Navigator.pop(context);
  }

  // create a new task
void createNewTask(){
    showDialog(context: context, builder:(context){
      return DialogeBox(controller: _controller, onSave: onSavebutton, onCancel:OnCancel,
      //
      );
    });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
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
                taskCompleted: toDoList[index][1],
                onChanged: (value) => CheckboxChanged(value, index),
                index: toDoList.length,
              );
            }));
  }
}
