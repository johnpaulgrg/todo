import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/state/task_state.dart';
import 'package:todo/styles/text_styles.dart';

// widget to show incompletetasks
class IncompleteTasks extends StatelessWidget {
  final incompleteTasks;
  IncompleteTasks(this.incompleteTasks);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<TasksState>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Incomplete",
          style: completeHeadStyle,
        ),
        SizedBox(height: 16),
        ListView.builder(
            itemCount: incompleteTasks.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        state.updateTask(
                            taskKey: incompleteTasks[index]['index'],
                            task: Task(incompleteTasks[index]['task'].name,
                                isCompleted: true));
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/icons/Unchecked.png"))),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        incompleteTasks[index]['task'].name,
                        style: incompleteTaskStyle,
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}
