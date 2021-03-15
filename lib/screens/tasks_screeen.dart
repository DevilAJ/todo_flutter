import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(),
            ),
            isScrollControlled: true,
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 30.0,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ToDo List',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  ' ${Provider.of<TaskData>(context).taskCount} tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Provider.of<TaskData>(context).taskCount == 0
                  ? Center(child: Text('No task added'))
                  : TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
