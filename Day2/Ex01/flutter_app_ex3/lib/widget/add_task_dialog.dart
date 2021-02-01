import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_ex3/common/app_style.dart';
import 'package:flutter_app_ex3/widget/custom_action_button.dart';
import 'package:flutter_app_ex3/model/task.dart';

import 'custom_textfield.dart';
import '../model/list_task.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(Task task) saveClick;

  AddTaskDialog({this.saveClick});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Add new task",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 24,
          ),
          CustomTextField(
            labelText: 'Enter title',
            controller: titleController,
          ),
          SizedBox(height: 12),
          CustomTextField(
            labelText: 'Enter description',
            controller: desController,
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 24,
          ),
          CustomActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              var task = Task(
                  title: titleController.text,
                  subTitle: desController.text,
                  startColor:
                      listRandomColor[Random().nextInt(listRandomColor.length)]
                          [0],
                  endColor:
                      listRandomColor[Random().nextInt(listRandomColor.length)]
                          [1],
                  time: '12pm',
                  completed: false);
              widget.saveClick(task);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
