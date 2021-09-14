import 'package:flutter/material.dart';
import 'package:todo/styles/text_styles.dart';

// widget to show completedtasks
class CompletedTasks extends StatelessWidget {
  final completedTasks;
  CompletedTasks(this.completedTasks);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Completed",
          style: completeHeadStyle,
        ),
        SizedBox(height: 16),
        ListView.builder(
            itemCount: completedTasks.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              print(completedTasks);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Icon(
                        Icons.check,
                        size: 14,
                      ),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/Unchecked.png"))),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        completedTasks[index]['task'].name,
                        style: incompleteTaskStyle,
                      ),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }
}
