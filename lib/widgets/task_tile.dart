import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.task, this.isChecked, this.checkBoxCallback, this.onLongPress});

  final String task;
  final bool isChecked;
  final Function checkBoxCallback;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        task,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
