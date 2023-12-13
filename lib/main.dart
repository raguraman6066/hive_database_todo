import 'package:flutter/material.dart';
import 'package:hive_database/todo_home.dart';
import 'package:hive_database/todo_model.dart';
import 'package:hive_flutter/adapters.dart';

import 'color_schemes.g.dart';
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _currentThemeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: TodoHome(
        toggleTheme: _toggleTheme,
      ),
      themeMode: _currentThemeMode,
    );
  }

  void _toggleTheme() {
    setState(() {
      _currentThemeMode = _currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }
}
