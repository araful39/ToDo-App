import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogeBox extends StatelessWidget {
  final phoneController;
  final taskController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogeBox({
    super.key,
    required this.phoneController,
    required this.taskController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 190,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Subject",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
              ),
            ),
            TextField(
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              controller: taskController,
              decoration: InputDecoration(
                hintText: "descreeption",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
              ),
            ),

            // save button or cancel
            Row(
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                SizedBox(
                  width: 15,
                ),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
