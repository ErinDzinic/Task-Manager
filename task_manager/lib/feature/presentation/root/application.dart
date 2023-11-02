import 'package:flutter/material.dart';
import '../common/app_bar_widget.dart';
import '../common/bottom_sheet_dialog.dart';
import '../helpers/app_colors.dart';
import '../pages/tasks_list.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheetDialog(context),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        backgroundColor: greenColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const TasksList(),
    );
  }
}
