import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/feature/presentation/helpers/app_labels.dart';
import '../../bloc/tasks_bloc.dart';
import '../../domain/models/task_model.dart';
import '../common/card_widget.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TasksLoaded) {
          List<TaskModel>? tasks = state.tasks;
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, index) =>
                          CardWidget(task: tasks[index]))
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text(pogreskaLabel));
        }
      },
    );
  }
}
