import 'package:flutter/material.dart';
import 'package:hive_database/todo_home.dart';
import 'package:hive_database/todo_model.dart';
import 'package:hive_flutter/adapters.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //register
  Hive.registerAdapter(TodoAdapter());
  //open
  await Hive.openBox<Todo>('todo');
  //other hive box
  await Hive.openBox('demo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoHome(),
    );
  }
}
