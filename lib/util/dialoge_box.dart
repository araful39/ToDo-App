import 'package:flutter/material.dart';

import 'my_button.dart';
class DialogeBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogeBox({super.key, required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller:controller,
              decoration: InputDecoration(
                hintText: "Add a new task",
                focusedBorder: OutlineInputBorder(

                  borderSide: BorderSide(color: Colors.black,width: 1)
                ),
                enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(color: Colors.black,width: 1)
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // save button or cancel
            Row(
              children: [
                MyButton(text: 'Save', onPressed:onSave,),
                SizedBox(
                  width: 15,
                ),
                MyButton(text: 'Cancel', onPressed: onCancel,)

              ],
            )
          ],
        ),
      ),
    );
  }
}
