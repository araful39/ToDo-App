import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogeBox extends StatelessWidget {
  final taskSubController;
  final taskDescreptionController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogeBox({
    super.key,
    required this.taskSubController,
    required this.taskDescreptionController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SingleChildScrollView(
        child: Container(
        height: h/2.5,
          child: Column(

            children: [
              // get user input
              TextField(
                maxLength: 20,
                showCursor: true,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                controller: taskSubController,
                decoration: InputDecoration(

                  hintText: "Subject",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                ),
              ),
              TextField(
                maxLength: 60,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                controller: taskDescreptionController,
                decoration: InputDecoration(
                  hintText: "descreeption",

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                ),
              ),
             SizedBox(
               height: 5,
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
