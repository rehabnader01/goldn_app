import 'package:flutter/material.dart';
import 'package:goldn/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required  this.onPressed, required this.color,
  });
final Color color;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
            WidgetStateProperty.all(color),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,style: TextStyle(
            color: AppColors.blackColor),
          ),
        ),
      ),
    );
  }
}
