import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isCompleted;

  Task(this.name, {this.isCompleted = false});
}
