import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String messageText;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Colors.lightBlueAccent,
              onChanged: (value) {
                messageText = value;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              child: Text('Add'),
              onPressed: () {
                if (messageText != null) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(messageText);
                  Navigator.pop(context);
                  messageText = null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
