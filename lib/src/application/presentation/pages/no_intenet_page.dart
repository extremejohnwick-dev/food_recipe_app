import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipe_app/src/core/constants/app_colors.dart';
import 'package:food_recipe_app/src/core/constants/app_sizes.dart';
import 'package:food_recipe_app/src/core/constants/app_styles.dart';
import 'package:food_recipe_app/src/data/services/no_internet_services.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class NoIntenetPage extends StatefulWidget {
  const NoIntenetPage({super.key});

  @override
  State<NoIntenetPage> createState() => _NoIntenetPageState();
}

class _NoIntenetPageState extends State<NoIntenetPage> {
  bool isloading = false;
  Future<bool> _refresh() async {
    setState(() {
      isloading = true;
    });
    final x = await NoInternetServices().refreshinternet();
    if (!mounted) return false;
    setState(() {
      isloading = false;
    });
    if (x) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 300),
          content: Text(
            'No internet Connection',
            style: AppTextStyles.bodyMedium.copyWith(fontFamily: 'poppins'),
          ),
        ),
      );
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/No connection-bro.svg',
              height: media.height * .5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Oops!',
                  style: AppTextStyles.h1.copyWith(
                    fontFamily: 'mons',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(AppSizes.kspace16),
                Text(
                  textAlign: TextAlign.center,
                  'The page cannot be acces check your internet or wifi',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontFamily: 'manrope',
                  ),
                ),
                Gap(AppSizes.kspace16),
                SizedBox(
                  width: media.width * .8,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.lightgreen,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSizes.kradiusLg,
                          ),
                        ),
                      ),
                    ),
                    onPressed: isloading ? null : _refresh,
                    icon: isloading
                        ? null
                        : Icon(
                            Iconsax.refresh,
                            size: AppSizes.kiconLg,
                            color: AppColors.black,
                          ),
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isloading
                          ? Text(
                              'Checking...',
                              style: AppTextStyles.bodyLarge.copyWith(
                                fontFamily: 'manrope',
                                color: AppColors.black,
                              ),
                            )
                          : Text(
                              'Reload',
                              style: AppTextStyles.bodyLarge.copyWith(
                                fontFamily: 'manrope',
                                color: AppColors.black,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
