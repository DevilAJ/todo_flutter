class Task {
  Task({this.taskData, this.isDone = false});
  final String taskData;
  bool isDone;
  void taskStateChange() {
    isDone = !isDone;
  }
}
