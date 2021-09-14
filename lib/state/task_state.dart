import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/task.dart';

// for state management coupled with hive as local database
class TasksState extends ChangeNotifier {
  String _boxName = "tasksBox";
  TasksState() {
    getTasks();
  }

  List<Task> tasks = [];

  void getTasks() async {
    var box = await Hive.openBox<Task>(_boxName);
    tasks = box.values.toList();
    notifyListeners();
  }

  void addTask(Task newTask) async {
    var box = await Hive.openBox<Task>(_boxName);

    await box.add(newTask);

    tasks = box.values.toList();
    notifyListeners();
  }

  void updateTask({Task task, int taskKey}) async {
    var box = await Hive.openBox<Task>(_boxName);
    await box.put(taskKey, task);
    tasks = box.values.toList();
    notifyListeners();
  }
}
