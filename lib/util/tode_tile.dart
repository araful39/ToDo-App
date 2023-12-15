import 'package:flutter/material.dart';
class TodoTile extends StatelessWidget {
 final String taskName;
  final bool taskCompleted;
 Function(bool?)? onChanged;
 int index;



 TodoTile({super.key,required this.taskName, required this.taskCompleted,required this.onChanged,required this.index});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      child: Container(

        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Row(
          children: [

            //checkbos
            Checkbox(value: taskCompleted, onChanged: onChanged,checkColor: Colors.black,),

            // task name
            Text(taskName,style: TextStyle(decoration:taskCompleted?TextDecoration.lineThrough:TextDecoration.none ),),
          ],
        ),
        decoration: BoxDecoration(
          color:Colors.yellow
        ),
      ),
    );
  }
}
