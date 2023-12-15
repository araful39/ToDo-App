import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogeBox extends StatelessWidget {
  final taskNameController;
  final taskDescreptionController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogeBox(
      {super.key,
      required this.taskNameController,
      required this.onSave,
      required this.onCancel,
      required this.taskDescreptionController,});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SingleChildScrollView(
        child: Container(
          height: h/2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              TextField(
                controller: taskNameController,
                maxLength: 30,
                decoration: InputDecoration(
                  hintText: "Subject",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                ),
              ),
              TextField(
                controller: taskDescreptionController,
                maxLength: 60,
                decoration: InputDecoration(
                  hintText: "Descreption",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                ),
              ),
              SizedBox(
                height: 20,
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
      ),
    );
  }
}
