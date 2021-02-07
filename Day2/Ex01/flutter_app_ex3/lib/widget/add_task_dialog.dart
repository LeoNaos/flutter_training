import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_ex3/common/app_style.dart';
import 'package:flutter_app_ex3/widget/custom_action_button.dart';
import 'package:flutter_app_ex3/model/task.dart';

import 'custom_textfield.dart';
import '../model/list_task.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(Task task) saveClick;
  final Function(Task task, int index) editClick;
  final Task task;

  AddTaskDialog({this.task, this.saveClick, this.editClick});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  // Properties
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  // Life cycle
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.task != null) {
      titleController.text = widget.task.title;
      desController.text = widget.task.subTitle;
    }
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
              child: const Text(
            "Add new task",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            labelText: 'Enter title',
            controller: titleController,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            labelText: 'Enter description',
            controller: desController,
          ),
          const SizedBox(height: 12),
          const SizedBox(
            height: 24,
          ),
          CustomActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              Task task;
              if (widget.task != null) {
                task = widget.task;
                int index = tasks.indexOf(widget.task);
                task.title = titleController.text;
                task.subTitle = desController.text;
                widget.editClick(task, index);
              } else {
                task = Task(
                    title: titleController.text,
                    subTitle: desController.text,
                    startColor: listRandomColor[
                        Random().nextInt(listRandomColor.length)][0],
                    endColor: listRandomColor[
                        Random().nextInt(listRandomColor.length)][1],
                    time: '12pm',
                    completed: false);
                widget.saveClick(task);
              }
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
