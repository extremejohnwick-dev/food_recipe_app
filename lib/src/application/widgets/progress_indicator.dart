import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Myprogressindicator extends StatelessWidget {
  const Myprogressindicator({
    super.key,
    required this.text,
    required this.color,
    required this.backgroundcolor,
    required this.perentage,
    required this.data,
  });
  final String text;
  final Color color;
  final Color backgroundcolor;
  final String perentage;
  final double data;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: AppSizes.kspace20,
      progressColor: color,
      percent: data,
      backgroundColor: backgroundcolor.withValues(alpha: .2),
      animation: true,
      curve: Curves.easeInOut,
      restartAnimation: true,
      reverse: true,
      circularStrokeCap: CircularStrokeCap.round,
      header: Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.kspace8),
        child: Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(fontFamily: 'poppins'),
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: AppSizes.kspace8),
        child: Text(
          perentage,
          style: AppTextStyles.bodySmall.copyWith(fontFamily: 'poppins'),
        ),
      ),
    );
  }
}
