import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/application/presentation/pages/home_page.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.kspace10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/svg/png/34551296a9d80577754d0f6fcacde9fa-removebg-preview.png',
              ),
              SizedBox(
                height: media.height * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Don\'t Worry! Let us Cook your food😋',
                      style: AppTextStyles.h1.copyWith(fontFamily: 'poppins'),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Don\'t be confused, Complete your nutrional needs by choosing food here!',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'manrope',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      ),
                      child: Container(
                        width: media.width * .9,
                        height: AppSizes.buttonHeight,
                        decoration: BoxDecoration(
                          gradient: AppColors.bg,
                          borderRadius: BorderRadius.circular(
                            AppSizes.kradiusLg,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontFamily: 'poppins',
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
