import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/todo_model.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);
  final taskTitle = TextEditingController();
  Box todoBox = Hive.box<Todo>('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: taskTitle,
              decoration: InputDecoration(
                hintText: 'Task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (taskTitle.text.trim() != '') {
                    Todo newTodo =
                        Todo(taskTitle: taskTitle.text, isCompleted: false);
                    todoBox.add(newTodo);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Task'))
          ],
        ),
      ),
    );
  }
}
