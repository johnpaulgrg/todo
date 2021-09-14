import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo/state/task_state.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksState(),
      child: MaterialApp(
        title: 'Todo',
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
