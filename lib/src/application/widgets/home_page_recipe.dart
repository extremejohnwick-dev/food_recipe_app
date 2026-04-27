import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/application/presentation/pages/details.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';
import 'package:food_recipe_app/src/data/models/recipe.dart';

class HomePageRecipe extends StatelessWidget {
  const HomePageRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recipemenu.length,
          (index) => GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Details(item: recipemenu[index]),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(right: AppSizes.kspace12),
              height: media.height * .4,
              width: media.width * .65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.kradiusLg),
                image: DecorationImage(
                  fit: BoxFit.none,
                  image: AssetImage(recipemenu[index].image),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: recipemenu[index].fav
                                ? AppColors.red
                                : AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: recipemenu[index].fav
                                  ? AppColors.offwhite
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: media.height * .12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.kradiusLg),
                      color: AppColors.black.withValues(alpha: .4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.kspace10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                recipemenu[index].recipename,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontFamily: 'poppins',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '⭐${recipemenu[index].rating.toString()}',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontFamily: 'poppins',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '1 Bowl(${recipemenu[index].weight}g)',
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontFamily: 'manrope',
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            '${recipemenu[index].calories}Kcal | 20% AFS',
                            style: AppTextStyles.bodySmall.copyWith(
                              fontFamily: 'mons',
                              color: AppColors.white,
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
      ),
    );
  }
}
