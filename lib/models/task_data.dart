import 'package:flutter/cupertino.dart';
import 'tasks.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount => _tasks.length;
  void addTask(String taskData) {
    _tasks.add(Task(taskData: taskData));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.taskStateChange();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
