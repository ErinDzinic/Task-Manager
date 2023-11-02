import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_manager/feature/domain/models/task_model.dart';
import 'package:task_manager/feature/domain/repositories/task_repository.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskRepository _taskRepository;
  TasksBloc(this._taskRepository) : super(TasksLoading()) {
    on<LoadTasksEvent>(_onLoadTasksEvent);
    on<AddTaskEvent>(_onAddTaskEvent);
    on<RemoveTaskEvent>(_onRemoveTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
  }

  Future<void> _onLoadTasksEvent(
      LoadTasksEvent event, Emitter<TasksState> emit) async {
    try {
      final tasks = await _taskRepository.fetchTasks();

      emit(TasksLoaded(tasks: tasks));
    } catch (error) {
      emit(TasksErrorState(error: error.toString()));
    }
  }

  Future<void> _onAddTaskEvent(
      AddTaskEvent event, Emitter<TasksState> emit) async {
    final state = this.state;

    if (state is TasksLoaded) {
      try {
        await _taskRepository.addTask(event.task);
        final updatedTasks = await _taskRepository.fetchTasks();
        emit(TasksLoaded(tasks: updatedTasks));
      } catch (error) {
        emit(TasksErrorState(error: error.toString()));
      }
    }
  }

  Future<void> _onRemoveTaskEvent(
      RemoveTaskEvent event, Emitter<TasksState> emit) async {
    final state = this.state;
    if (state is TasksLoaded) {
      try {
        await _taskRepository.removeTask(event.task.id!);
        emit(TasksLoaded(
            tasks: state.tasks
                .where((task) => task.id != event.task.id)
                .toList()));
      } catch (error) {
        emit(TasksErrorState(error: error.toString()));
      }
    }
  }

  Future<void> _onUpdateTaskEvent(
      UpdateTaskEvent event, Emitter<TasksState> emit) async {
    try {
      final state = this.state;
      if (state is TasksLoaded) {
        final List<TaskModel> tasks = (state.tasks
                .map((task) => task.id == event.task.id ? event.task : task))
            .toList();
        await _taskRepository.updateTask(event.task);
        emit(TasksLoaded(tasks: tasks));
      }
    } catch (error) {
      emit(TasksErrorState(error: error.toString()));
    }
  }
}
