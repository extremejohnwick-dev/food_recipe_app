import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/application/presentation/pages/home_page.dart';
import 'package:food_recipe_app/src/application/widgets/progress_indicator.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';
import 'package:food_recipe_app/src/data/models/category.dart';
import 'package:food_recipe_app/src/data/models/recipe.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.item});
  final Recipe item;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: Stack(
        children: [
          Container(
            height: media.height * .5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.none,
                image: AssetImage(item.image),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Iconsax.arrow_left, color: AppColors.offwhite),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Iconsax.shop, color: AppColors.offwhite),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Container(
              height: media.height * .5,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.kspace20,
                  horizontal: AppSizes.kspace12,
                ),
                child: Column(
                  children: [
                    Gap(AppSizes.kspace24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.transaprent,
                          radius: AppSizes.kspace20,
                          child: Image.asset(item.wonerimage),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.wonername,
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${item.recipeshared.toString()} Recipe Shared',
                              style: AppTextStyles.bodySmall.copyWith(
                                fontFamily: 'manrope',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.rating}⭐⭐',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '24 reviews',
                              style: AppTextStyles.bodySmall.copyWith(
                                fontFamily: 'manrope',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(AppSizes.kspace20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.recipename,
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontFamily: 'manrope',
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '1 Bowl(${item.weight}g)',
                              style: AppTextStyles.bodySmall.copyWith(
                                fontFamily: 'manrope',
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontFamily: 'manrope',
                            color: AppColors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Gap(AppSizes.kspace16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Myprogressindicator(
                          text: 'Carbs',
                          color: AppColors.red,
                          backgroundcolor: AppColors.red,
                          perentage: '16%',
                          data: 0.2,
                        ),
                        Myprogressindicator(
                          text: 'Sigma',
                          color: AppColors.green,
                          backgroundcolor: AppColors.green,
                          perentage: '96%',
                          data: 0.9,
                        ),
                        Myprogressindicator(
                          text: 'Calories',
                          color: AppColors.yellow,
                          backgroundcolor: AppColors.yellow,
                          perentage: '15%',
                          data: 0.2,
                        ),
                        Myprogressindicator(
                          text: 'Fat',
                          color: AppColors.purple,
                          backgroundcolor: AppColors.purple,
                          perentage: '56%',
                          data: 0.4,
                        ),
                        Myprogressindicator(
                          text: 'Protein',
                          color: AppColors.orange,
                          backgroundcolor: AppColors.orange,
                          perentage: '86%',
                          data: 0.6,
                        ),
                      ],
                    ),
                    Gap(AppSizes.kspace16),
                    Row(
                      children: [
                        Text(
                          'Ingredients',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontFamily: 'poppins',
                            color: AppColors.red,
                            fontWeight: FontWeight.w500,
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
                              radius: AppSizes.kspace20,
                              child: Image.asset(cateogrylist[index].image),
                            ),
                            Gap(3),
                            Text(
                              cateogrylist[index].name,
                              style: AppTextStyles.bodySmall.copyWith(
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 15,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.kspace10),
                child: Icon(Iconsax.heart, color: AppColors.offwhite),
              ),
            ),
          ),
          Positioned(
            bottom: media.height * .5,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: AppColors.white,
                height: 80.0,
                width: 80.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
