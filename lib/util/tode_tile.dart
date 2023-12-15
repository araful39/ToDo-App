import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final String taskDescreption;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.taskDescreption,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(10),
          ),

        ],
      ),
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(20),
          ),

        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(color: Colors.yellow),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        taskName,

                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                    ),
                    //checkbox
                    Checkbox(
                      // hoverColor: Colors.indigo,
                      activeColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      value: taskCompleted,
                      onChanged: onChanged,
                      checkColor: Colors.white,
                    ),

                    // task name
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text(taskDescreption, overflow: TextOverflow.ellipsis,style: TextStyle(),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Slidable(
// // Specify a key if the Slidable is dismissible.
// key: const ValueKey(0),
//
// // The start action pane is the one at the left or the top side.
// startActionPane: ActionPane(
// // A motion is a widget used to control how the pane animates.
// motion: const ScrollMotion(),
//
// // A pane can dismiss the Slidable.
// dismissible: DismissiblePane(onDismissed: () {}),
//
// // All actions are defined in the children parameter.
// children: const [
// // A SlidableAction can have an icon and/or a label.
// SlidableAction(
// onPressed: doNothing,
// backgroundColor: Color(0xFFFE4A49),
// foregroundColor: Colors.white,
// icon: Icons.delete,
// label: 'Delete',
// ),
// SlidableAction(
// onPressed: doNothing,
// backgroundColor: Color(0xFF21B7CA),
// foregroundColor: Colors.white,
// icon: Icons.share,
// label: 'Share',
// ),
// ],
// ),
//
// // The end action pane is the one at the right or the bottom side.
// endActionPane: const ActionPane(
// motion: ScrollMotion(),
// children: [
// SlidableAction(
// // An action can be bigger than the others.
// flex: 2,
// onPressed: doNothing,
// backgroundColor: Color(0xFF7BC043),
// foregroundColor: Colors.white,
// icon: Icons.archive,
// label: 'Archive',
// ),
// SlidableAction(
// onPressed: doNothing,
// backgroundColor: Color(0xFF0392CF),
// foregroundColor: Colors.white,
// icon: Icons.save,
// label: 'Save',
// ),
// ],
// ),
//
// // The child of the Slidable is what the user sees when the
// // component is not dragged.
// child: const ListTile(title: Text('Slide me')),
// ),
