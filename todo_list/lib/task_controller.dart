import 'package:flutter/material.dart';

import 'task_model.dart';

class TaskController extends ChangeNotifier {
  TaskController._();
  static final TaskController _controller = TaskController._();
  factory TaskController() => _controller;

  void addTask(Task task) {
    TaskModel().addTask(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }
}
