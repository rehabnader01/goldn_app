import 'package:flutter/material.dart';
import 'package:goldn/core/constants/app_colors.dart';
import 'package:goldn/core/constants/app_strings.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(text: AppStrings.gold, color: AppColors.goldColor,onPressed: (){},),
          SizedBox(height: 15,),
          CustomButton(text: AppStrings.silver, color: AppColors.silverColor,onPressed: (){},)
        ],
      )

    );
  }
}
