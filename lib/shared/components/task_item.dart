import 'package:flutter/material.dart';
import 'package:todo_sqflite/shared/cubit/cubit.dart';

class TaskItem extends StatelessWidget {
  final Map model;
  const TaskItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          child: Center(
            child: Text(
              '${model['time']}',
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
        ),
        title: Text(
          '${model['title']}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          '${model['date']}',
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'done',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.check_circle_outline,
                  color: Colors.green[700],
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'archive',
                    id: model['id'],
                  );
                },
                icon: const Icon(Icons.archive_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
