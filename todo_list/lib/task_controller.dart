import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'task_model.dart';

class TaskController extends ChangeNotifier {
  TaskController._();
  static final TaskController _controller = TaskController._();
  factory TaskController() => _controller;

  List<Task> tasks = [];

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadTasks();
    }
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks');
    if (taskList != null) {
      tasks = taskList.map((taskJson) => Task.fromJson(json.decode(taskJson))).toList();
    }
    notifyListeners();
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskList = tasks.map((task) => json.encode(task.toJson())).toList();
    prefs.setStringList('tasks', taskList).then((value) => {});
  }

  void addTask(Task task) {
    tasks.add(task);
    saveTasks();
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.isCompleted = !task.isCompleted;
    saveTasks();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    saveTasks();
    notifyListeners();
  }
}