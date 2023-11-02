import 'package:flutter/material.dart';
import '../helpers/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isCancelButton;
  final bool isActive;

  const ButtonWidget(
      {super.key,
      required this.onTap,
      required this.text,
      this.isCancelButton = false,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          color: isActive
              ? (isCancelButton ? redButtonColor : greenColor)
              : greyButtonColor,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
