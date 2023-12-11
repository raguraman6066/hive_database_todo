import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/add_todo.dart';
import 'package:hive_database/todo_model.dart';
import 'package:hive_flutter/adapters.dart';

class TodoHome extends StatelessWidget {
  TodoHome({Key? key}) : super(key: key);
  Box todoBox = Hive.box<Todo>('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo Hive')),
      body: ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        //important Box box
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(child: Text('No todo items'));
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Todo todo = box.getAt(index);
                return ListTile(
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) {
                      Todo newTodo =
                          Todo(taskTitle: todo.taskTitle, isCompleted: value!);
                      box.putAt(index, newTodo);
                    },
                  ),
                  title: Text(
                    todo.taskTitle,
                    style: TextStyle(
                        fontSize: 20,
                        color: todo.isCompleted ? Colors.green : Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        box.deleteAt(index);
                      },
                      icon: Icon(Icons.delete)),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddTodo(),
            ));
          },
          child: Icon(Icons.add)),
    );
  }
}
