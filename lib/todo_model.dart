import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  final String taskTitle;
  @HiveField(1)
  final bool isCompleted;

  Todo({required this.taskTitle, required this.isCompleted});
}
//dart run build_runner build