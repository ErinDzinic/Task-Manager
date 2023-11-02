import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/config/my_bloc_observer.dart';
import 'package:task_manager/feature/domain/repositories/task_repository.dart';
import 'package:task_manager/feature/presentation/root/application.dart';

import 'feature/bloc/tasks_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                TasksBloc(TaskRepository())..add(LoadTasksEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Application(),
      ),
    );
  }
}
