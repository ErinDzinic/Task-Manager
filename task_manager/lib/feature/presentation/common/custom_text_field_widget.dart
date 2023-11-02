import 'package:flutter/material.dart';
import '../helpers/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controllerNaslov;
  final String title;

  const CustomTextFieldWidget(
      {super.key, required this.controllerNaslov, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerNaslov,
      decoration: InputDecoration(
        labelText: title,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greenColor),
        ),
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
