import 'package:flutter/material.dart';
import 'task_controller.dart';
import 'task_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TaskController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        actions: [
          IconButton(
            onPressed: () {
              showAddTaskDialog(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final tasks = controller.tasks;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return CheckboxListTile(
                title: Text(task.title),
                value: task.isCompleted,
                onChanged: (bool? value) {
                  controller.toggleTask(task);
                },
              );
            },
          );
        },
      ),
    );
  }

  void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskDialog();
      },
    );
  }
}

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return AlertDialog(
      title: const Text('Add task'),
      content: TextField(
        controller: titleController,
        decoration: const InputDecoration(
          hintText: 'Title',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final title = titleController.text.trim();
            final task = Task(title: title);
            TaskController().addTask(task);
            Navigator.pop(context);
          },
          child: const Text('Add'),
        )
      ],
    );
  }
}