part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends TasksEvent {
  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TasksEvent {
  final TaskModel task;

  const AddTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveTaskEvent extends TasksEvent {
  final TaskModel task;

  const RemoveTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TasksEvent {
  final TaskModel task;

  const UpdateTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}
