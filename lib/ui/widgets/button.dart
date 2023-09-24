import 'package:flutter/material.dart';
import 'package:flutter_clendar_app03/contents/color.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeColors.primaryClr,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: ThemeColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
