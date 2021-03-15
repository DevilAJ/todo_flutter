import 'package:flutter/material.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          padding: EdgeInsets.only(
            top: 40,
            left: 20,
          ),
          itemCount: taskdata.taskCount,
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return TaskTile(
              task: task.taskData,
              isChecked: task.isDone,
              checkBoxCallback: (checkedValue) {
                taskdata.updateTask(task);
              },
              onLongPress: () {
                taskdata.removeTask(index);
              },
            );
          },
        );
      },
    );
  }
}
