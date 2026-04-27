import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';
import 'package:food_recipe_app/src/data/models/popular_menu.dart';

class HomepagePopularMenu extends StatefulWidget {
  const HomepagePopularMenu({super.key});

  @override
  State<HomepagePopularMenu> createState() => _HomepagePopularMenuState();
}

class _HomepagePopularMenuState extends State<HomepagePopularMenu> {
  int tracker = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          popularmenus.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                tracker = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.kspace16,
                vertical: AppSizes.kspace8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.kradiusXl),
                gradient: tracker == index ? AppColors.bg : AppColors.cg,
              ),
              child: Text(
                popularmenus[index],
                style: AppTextStyles.bodySmall.copyWith(
                  fontFamily: 'poppins',
                  color: tracker == index ? AppColors.white : AppColors.black,
                  fontWeight: tracker == index
                      ? FontWeight.bold
                      : FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
