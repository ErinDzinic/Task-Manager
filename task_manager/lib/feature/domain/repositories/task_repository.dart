import 'dart:convert';
import 'package:http/http.dart';
import '../models/task_model.dart';

class TaskRepository {
  static const String baseUrl =
      'https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/000/task/';

  Future<List<TaskModel>> fetchTasks() async {
    final response = await get(Uri.parse('$baseUrl.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return data.isNotEmpty
          ? data.entries
              .map((entry) =>
                  TaskModel.fromJson({'id': entry.key, ...entry.value}))
              .toList()
          : [];
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  Future<void> addTask(TaskModel task) async {
    final response = await post(
      Uri.parse('$baseUrl.json'),
      body: json.encode(task.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add task');
    }
  }

  Future<void> removeTask(String taskId) async {
    final response = await delete(
      Uri.parse('$baseUrl$taskId.json'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove task');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    final updatedTaskData = {
      'isActive': task.isActive,
    };

    final response = await patch(
      Uri.parse('$baseUrl${task.id}.json'),
      body: json.encode(updatedTaskData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }
}
