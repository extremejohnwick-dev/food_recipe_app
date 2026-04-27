import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipe_app/src/application/presentation/pages/no_intenet_page.dart';
import 'package:food_recipe_app/src/application/presentation/pages/onboarding_page.dart';
import 'package:food_recipe_app/src/data/services/no_internet_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NoInternetServices().intalize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: NoInternetServices.connectionstream,
        initialData: true,
        builder: (context, snapshot) {
          final data = snapshot.data ?? false;
          if (!data) {
            return const NoIntenetPage();
          }
          return const OnboardingPage();
        },
      ),
    );
  }
}
