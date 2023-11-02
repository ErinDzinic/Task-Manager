import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks_bloc.dart';
import '../../domain/models/task_model.dart';
import '../helpers/app_colors.dart';
import '../helpers/app_labels.dart';
import '../helpers/app_sizes.dart';
import '../helpers/spacing.dart';
import 'custom_button_widget.dart';

class CardWidget extends StatelessWidget {
  final TaskModel? task;
  const CardWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: (task?.isActive ?? true) ? greenCardColor : Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(Sizes.p12))),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task?.title ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: task!.isActive! ? greenColor : greyButtonColor),
              ),
              Text(
                task?.text ?? '',
                style: const TextStyle(fontSize: 18),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Divider(
                thickness: 2,
                color: task!.isActive!
                    ? const Color.fromARGB(255, 127, 162, 156)
                    : greyButtonColor,
              ),
              gapH10,
              Row(
                children: [
                  ButtonWidget(
                    isActive: task!.isActive!,
                    text: zavrsiLabel,
                    onTap: () => context.read<TasksBloc>().add(UpdateTaskEvent(
                        task: task!.copyWith(isActive: !task!.isActive!))),
                  ),
                  gapW10,
                  ButtonWidget(
                    text: ponistiLabel,
                    isCancelButton: true,
                    isActive: task!.isActive!,
                    onTap: () {
                      task != null
                          ? context
                              .read<TasksBloc>()
                              .add(RemoveTaskEvent(task: task!))
                          : null;
                    },
                  ),
                ],
              ),
              gapH20
            ],
          ),
        ),
      ),
    );
  }
}
