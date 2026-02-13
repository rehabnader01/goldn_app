import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldn/core/constants/app_mages.dart';
import 'package:goldn/core/constants/app_colors.dart';
import 'package:goldn/core/widgets/custom_app_bar_widget.dart';
import 'package:goldn/features/gold/data/repo/gold_repo.dart';
import 'package:goldn/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:goldn/features/gold/presentation/cubit/gold_states.dart';
import 'package:goldn/features/widgets/custom_metal_image.dart';
import 'package:goldn/features/widgets/custom_price_display.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepo())..getGold(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: CustomAppBar(
          title: 'Gold',
          backgroundColor: AppColors.blackColor,
          titleColor: AppColors.goldColor,
          showBackButton: true,
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.goldColor),
              );
            } else if (state is GoldErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        state.errMsg,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<GoldCubit>().getGold();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.goldColor,
                        foregroundColor: AppColors.blackColor,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is GoldSuccessState) {
              final metal = state.metalModel;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomMetalImage(imagePath: AppImages.gold),
                  const SizedBox(height: 20),
                  CustomPriceDisplay(
                    price: metal.formattedPrice,
                    textColor: AppColors.goldColor,
                    currency: metal.symbol,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Last updated: ${metal.updatedAtReadable}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
