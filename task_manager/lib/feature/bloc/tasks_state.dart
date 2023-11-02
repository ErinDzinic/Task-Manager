part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

final class TasksLoading extends TasksState {
  @override
  List<Object> get props => [];
}

final class TasksLoaded extends TasksState {
  final List<TaskModel> tasks;

  const TasksLoaded({this.tasks = const <TaskModel>[]});

  @override
  List<Object> get props => [tasks];
}

final class TasksErrorState extends TasksState {
  final String error;
  const TasksErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
