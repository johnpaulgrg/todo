import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/state/task_state.dart';
import 'package:todo/styles/colors.dart';
import 'package:todo/styles/text_styles.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String newtask;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SizedBox(height: 44),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create new task",
                    style: createTaskHead,
                  ),
                ),
                SizedBox(height: 35),
                Expanded(
                  child: TextField(
                    cursorColor: Color(0xff575767),
                    autofocus: true,
                    onChanged: (value) {
                      newtask = value;
                    },
                    style: hintStyle,
                    maxLines: null,
                    decoration: InputDecoration.collapsed(
                        hintStyle: hintStyle, hintText: 'New Task'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (newtask != null) {
                      Provider.of<TasksState>(context, listen: false)
                          .addTask(Task(newtask, isCompleted: false));
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 252,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xffff6644),
                      borderRadius: BorderRadius.circular(14),
                      border: new Border.all(
                        color: Color(0xffffa490),
                        width: 2.0,
                      ),
                    ),
                    child: Text(
                      "Save Task",
                      style: saveTask,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
