import 'package:flutter/material.dart';
import 'task_controller.dart';
import 'task_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    final model = TaskModel();
    final controller = TaskController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AddTaskDialog();
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return ListView.builder(
            itemCount: model.taskCount,
            itemBuilder: (context, index) {
              final item = model.tasks[index];
              return CheckboxListTile(
                title: Text(item.title),
                value: item.isCompleted,
                onChanged: (bool? value) {
                  controller.toggleTask(item);
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
        return const AddTaskDialog();
      },
    );
  }
}

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});
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
