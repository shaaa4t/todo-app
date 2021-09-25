import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:todo_sqflite/shared/components/task_item.dart';

class ConditionalBuilder extends StatelessWidget {
  final List<Map> tasks;
  const ConditionalBuilder({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildCondition(
      condition: tasks.isNotEmpty,
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            Text('No tasks yet!'),
          ],
        ),
      ),
      builder: (context) {
        return ListView.separated(
          itemBuilder: (context, index) => TaskItem(model: tasks[index]),
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsetsDirectional.only(
              start: 24,
              end: 24,
            ),
            child: Divider(),
          ),
          itemCount: tasks.length,
        );
      },
    );
  }
}
