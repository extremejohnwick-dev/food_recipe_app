import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';

class HomepageHeader extends StatelessWidget {
  const HomepageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Hello Arslan,\n',
                style: AppTextStyles.bodyMedium.copyWith(fontFamily: 'poppins'),
              ),
              TextSpan(
                text: 'What do you want to eat today!',
                style: AppTextStyles.bodySmall.copyWith(fontFamily: 'manrope'),
              ),
            ],
          ),
        ),
        Spacer(),
        Stack(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/svg/png/888e74b3c88b38aa6c25f7ee3552668c.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: AppSizes.kspace10,
                width: AppSizes.kspace10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightgreen,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
