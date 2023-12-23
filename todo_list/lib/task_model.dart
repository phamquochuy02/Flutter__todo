class Task {
  String title;
  bool isCompleted;

  Task({
    required this.title,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }
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

  Map<String, dynamic> toJson() {
    return {
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    final taskModel = TaskModel();
    final taskList = json['tasks'] as List<dynamic>;
    taskModel.tasks = taskList.map((taskJson) => Task.fromJson(taskJson)).toList();
    return taskModel;
  }
}