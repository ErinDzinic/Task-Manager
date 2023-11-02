import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks_bloc.dart';
import '../../domain/models/task_model.dart';
import '../helpers/app_labels.dart';
import '../helpers/app_sizes.dart';
import '../helpers/spacing.dart';
import 'custom_button_widget.dart';
import 'custom_text_field_widget.dart';

Future<dynamic> showBottomSheetDialog(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => const AddTaskWidget(),
  );
}

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  TextEditingController controllerNaslov = TextEditingController();
  TextEditingController controllerPodaci = TextEditingController();

  @override
  void dispose() {
    controllerNaslov.dispose();
    controllerPodaci.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is TasksLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(dodatZadatakLabel),
          ));
        }
      },
      child: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p12),
            child: Column(
              children: [
                CustomTextFieldWidget(
                  controllerNaslov: controllerNaslov,
                  title: unesiteNaslovLabel,
                ),
                CustomTextFieldWidget(
                    controllerNaslov: controllerPodaci,
                    title: unesiteDetaljeLabel),
                gapH20,
                ButtonWidget(
                  text: dodajZadatakLabel,
                  onTap: () {
                    context.read<TasksBloc>().add(AddTaskEvent(
                        task: TaskModel(
                            isActive: true,
                            title: controllerNaslov.text,
                            text: controllerPodaci.text)));

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
