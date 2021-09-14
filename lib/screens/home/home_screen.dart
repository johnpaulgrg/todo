import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/create_task_screen.dart';
import 'package:todo/screens/home/completed_tasks.dart';
import 'package:todo/screens/home/incomplete_tasks.dart';
import 'package:todo/state/task_state.dart';
import 'package:todo/styles/colors.dart';
import 'package:todo/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> incompleteTasks = [];
  List<Map<String, dynamic>> completedTasks = [];
  int i;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TasksState>(builder: (context, state, snapshot) {
        incompleteTasks = [];
        completedTasks = [];
        i = 0;
        state.tasks.forEach((task) {
          print(task.name);
          print(task.isCompleted);
          if (task.isCompleted) {
            completedTasks.add({"task": task, "index": i});
          } else {
            incompleteTasks.add({"task": task, "index": i});
          }
          i++;
        });
        return Scaffold(
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateTaskScreen()));
            },
            child: Container(
              width: 56,
              height: 56,
              child: CircleAvatar(
                backgroundColor: Color(0xffff6644),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Color(0xffffa490),
                  width: 2.0,
                ),
              ),
            ),
          ),
          body: Container(
            color: backgroundColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Image.asset(
                          "assets/logo/tasked.png",
                          width: 126.5,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "${incompleteTasks.length} incomplete, ${completedTasks.length} completed",
                          style: subheadingStyle,
                        ),
                        SizedBox(height: 16),
                        Divider(
                          thickness: 2,
                          height: 0,
                        ),
                        incompleteTasks.length == 0
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 1),
                                child: IncompleteTasks(incompleteTasks),
                              ),
                        completedTasks.length == 0
                            ? Container()
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: CompletedTasks(completedTasks),
                              )
                      ]),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
