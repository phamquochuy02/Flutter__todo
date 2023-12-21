class Task {
  String title;
  bool isCompleted;

  Task({
    required this.title,
    this.isCompleted = false,
  });
}

class TaskModel {
  TaskModel._();
  static final TaskModel _model = TaskModel._();
  factory TaskModel() => _model;

  List<Task> tasks = [];

  int get taskCount => tasks.length;

  void addTask(Task task) {
    tasks.add(task);
  }
}


