import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/application/widgets/home_page_recipe.dart';
import 'package:food_recipe_app/src/application/widgets/homepage_header.dart';
import 'package:food_recipe_app/src/application/widgets/homepage_popular_menu.dart';
import 'package:food_recipe_app/src/application/widgets/homepage_searchbar.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';
import 'package:food_recipe_app/src/data/models/category.dart';
import 'package:gap/gap.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tracker = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.kspace12),
            child: Column(
              children: [
                HomepageHeader(),
                Gap(AppSizes.kspace16),
                HomepageSearchbar(),
                Gap(AppSizes.kspace16),
                Row(
                  children: [
                    Text(
                      'Popular menus',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'manrope',
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Gap(AppSizes.kspace16),
                HomepagePopularMenu(),
                Gap(AppSizes.kspace16),
                HomePageRecipe(),
                Gap(AppSizes.kspace16),
                Row(
                  children: [
                    Text(
                      'Categories',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                Gap(AppSizes.kspace16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    cateogrylist.length,
                    (index) => Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.transaprent,
                          radius: AppSizes.kspace24,
                          child: Image.asset(cateogrylist[index].image),
                        ),
                        Text(
                          cateogrylist[index].name,
                          style: AppTextStyles.bodySmall.copyWith(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(AppSizes.kspace16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: AppSizes.kspace20,
                      child: Image.asset(
                        'assets/svg/png/d2354797cfb995122e8bf0248cb1fd76.png',
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.kspace32,
                      child: VerticalDivider(
                        color: AppColors.black.withValues(alpha: .3),
                      ),
                    ),
                    Gap(AppSizes.kspace8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alex Daniel',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontFamily: 'poppins',
                          ),
                        ),
                        Text(
                          'Our expert Chef',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontFamily: 'manrope',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        gap: 2,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 900),
        activeColor: AppColors.red,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.kspace20,
          vertical: AppSizes.kspace20,
        ),
        tabs: [
          GButton(icon: Iconsax.home, text: 'Home', style: GnavStyle.google),
          GButton(
            icon: Iconsax.heart,
            text: 'Favorite',
            style: GnavStyle.google,
          ),
          GButton(
            icon: Iconsax.search_favorite,
            text: 'Search',
            style: GnavStyle.google,
          ),
          GButton(icon: Iconsax.user, text: 'Account', style: GnavStyle.google),
        ],
      ),
    );
  }
}
