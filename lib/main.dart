import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:october_assignment/util/binding.dart';
import 'package:october_assignment/view/home_page.dart';
import 'package:october_assignment/view/login_screen.dart';
import 'package:october_assignment/view/res/strings_manager.dart';
import 'package:october_assignment/view/signup_screen.dart';
import 'package:october_assignment/view/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      getPages: [
        GetPage(
            name: StringsManager.splashRoute,
            page: () => const SplashScreen(),
            binding: Binding()),
        GetPage(
            name: StringsManager.homeRoute,
            page: () => HomePage(),
            binding: Binding()),
        GetPage(
            name: StringsManager.loginRoute,
            page: () => LoginScreen(),
            binding: Binding()),
        GetPage(
            name: StringsManager.signupRoute,
            page: () => SignupScreen(),
            binding: Binding()),
      ],
      initialRoute: StringsManager.loginRoute,
    );
  }
}
