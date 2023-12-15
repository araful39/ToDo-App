import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final String taskDescreption;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)?deleteFunction;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,

      required this.deleteFunction, required this.taskDescreption,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskName,

                    style: TextStyle(
                      fontSize: 25,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    checkColor: Colors.black,
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(taskDescreption)),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(color: Colors.yellow),
        ),
      ),
    );
  }
}
