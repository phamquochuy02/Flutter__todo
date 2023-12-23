import 'package:flutter/material.dart';
import 'task_list_view.dart';
import 'task_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TaskController().loadTasks();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskListView(),
    );
  }
}
