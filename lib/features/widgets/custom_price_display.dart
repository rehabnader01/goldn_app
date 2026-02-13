import 'package:flutter/material.dart';

class CustomPriceDisplay extends StatelessWidget {
  final String label;
  final String price;
  final String currency;
  final Color textColor;
  final double fontSize;
  final MainAxisAlignment alignment;

  const CustomPriceDisplay({
    super.key,
    this.label = 'Price: ',
    required this.price,
    this.currency = 'USD',
    required this.textColor,
    this.fontSize = 20,
    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' $currency',
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}