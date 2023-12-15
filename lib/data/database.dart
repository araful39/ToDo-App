import 'package:hive/hive.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

//reference our box
  final _myBox = Hive.box("mybox");
// run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Sub", "Descreption", false]
    ];
  }

// load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // udata the database
  void updataDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
