import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:october_assignment/controller/login_controller.dart';
import 'package:october_assignment/view/res/color_manager.dart';
import 'package:october_assignment/view/res/extension.dart';
import 'package:october_assignment/view/res/strings_manager.dart';
import 'package:october_assignment/view/res/values_manager.dart';
import 'package:october_assignment/view/signup_screen.dart';
import 'package:october_assignment/view/widgets/custom_button.dart';
import 'package:october_assignment/view/widgets/custom_social_part.dart';
import 'package:october_assignment/view/widgets/custom_text_field.dart';
import 'widgets/custom_clipper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  color: ColorManager.primary.withOpacity(0.2),
                  height: 180.0,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Image(
                        image: AssetImage("assets/images/logo.png"),
                        width: 200,
                        height: 120,
                      ),
                    ),
                    80.mh,
                    Container(
                      padding: const EdgeInsets.only(left: AppPadding.p13),
                      child: Text(
                        'Sign in to your account',
                        style: TextStyle(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSiz.s20),
                      ),
                    ),
                    20.mh,
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            validator: (email) =>
                                controller.validateEmail(email),
                            textEditingController: emailController,
                            text: 'Email',
                            textInputType: TextInputType.emailAddress,
                            obscure: false,
                          ),
                          30.mh,
                          CustomTextFormField(
                            validator: (pass) =>
                                controller.validatePassword(pass),
                            textEditingController: passwordController,
                            text: 'Password',
                            textInputType: TextInputType.visiblePassword,
                            obscure: true,
                          ),
                          35.mh,
                          Container(
                            alignment: Alignment.center,
                            child: CustomButton(
                              text: 'Sign In',
                              textColor: ColorManager.whiteColor,
                              onPressed: () {
                                // Get.offNamed(StringsManager.splashRoute);
                                controller.onLogin();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    50.mh,
                    const CustomSocialPart(),
                    60.mh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSiz.s16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(StringsManager.signupRoute);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: AppSiz.s16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
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
