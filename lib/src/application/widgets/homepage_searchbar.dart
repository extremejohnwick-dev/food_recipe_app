import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';
import 'package:iconsax/iconsax.dart';

class HomepageSearchbar extends StatelessWidget {
  const HomepageSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.kradiusXl),
      ),
      child: TextField(
        cursorHeight: AppSizes.kspace20,
        cursorRadius: Radius.circular(AppSizes.kradiusLg),
        cursorColor: AppColors.black,
        style: AppTextStyles.bodyMedium.copyWith(fontFamily: 'manrope'),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Iconsax.search_favorite),
          hintText: 'Search Recipe...',
          hintStyle: AppTextStyles.bodyMedium.copyWith(fontFamily: 'manrope'),
        ),
      ),
    );
  }
}
