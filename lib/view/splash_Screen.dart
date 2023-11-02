import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find();
    controller.getUser();
    controller.fetchData();
    Timer(const Duration(seconds: 10), () {
      Get.offNamed('/home');
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Lottie.asset("assets/images/splash.json"),
      ),
    );
  }
}
