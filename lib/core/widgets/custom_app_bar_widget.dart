import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool centerTitle;
  final bool showBackButton;
  final Color? backButtonColor;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    this.fontSize = 28,
    this.fontWeight = FontWeight.bold,
    this.centerTitle = true,
    this.showBackButton = false,
    this.backButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: backButtonColor ?? titleColor,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      automaticallyImplyLeading: showBackButton,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
