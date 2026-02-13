import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldn/core/constants/app_colors.dart';
import 'package:goldn/core/constants/app_mages.dart';
import 'package:goldn/core/widgets/custom_app_bar_widget.dart';
import 'package:goldn/features/silver/data/repo/silver_repo.dart';
import 'package:goldn/features/silver/presentation/cubit/silver_cubit.dart';
import 'package:goldn/features/silver/presentation/cubit/silver_states.dart';
import 'package:goldn/features/widgets/custom_metal_image.dart';
import 'package:goldn/features/widgets/custom_price_display.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(SilverRepo())..getSilver(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: CustomAppBar(
          title: 'Silver',
          backgroundColor: AppColors.blackColor,
          titleColor: AppColors.silverColor,
          showBackButton: true,
        ),
        body: BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.silverColor),
              );
            } else if (state is SilverErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        state.errMsg,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<SilverCubit>().getSilver();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.silverColor,
                          foregroundColor: AppColors.blackColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is SilverSuccessState) {
              final metal = state.metalModel;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomMetalImage(imagePath: AppImages.silver),
                  const SizedBox(height: 20),
                  CustomPriceDisplay(
                    price: metal.formattedPrice,
                    textColor: AppColors.silverColor,
                    currency: metal.symbol,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Updated: ${metal.updatedAtReadable}',
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
