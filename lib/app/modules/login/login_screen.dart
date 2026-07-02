import 'package:alive_app/app/core/sizes/responsive_extension.dart';
import 'package:alive_app/app/core/theme/app_colors.dart';
import 'package:alive_app/app/core/utils/app_validators.dart';
import 'package:alive_app/app/widgets/custom_hyperlink_widget.dart';
import 'package:alive_app/app/widgets/custom_text_widget.dart';
import 'package:alive_app/app/widgets/custom_textfield_widget.dart';
import 'package:alive_app/app/widgets/login_background_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.dp),
                child: Column(
                  children: [
                    Container(
                      width: 100.dp,
                      height: 100.dp,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 40,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/app_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomTextWidget(
                      text: 'Welcome back! 👋',
                      textStyle: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.dp),
                    CustomTextWidget(
                      text: 'Sign in to continue your live streaming journey.',
                      textStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 28.dp),
                    Obx(
                      () => Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            CustomTextfieldWidget(
                              controller: controller.emailController,
                              hint: 'Enter Registered Email or Phone No.',
                              labelText: 'Email ID or Phone Number',
                              validator: AppValidators.emailOrPhone,
                            ),
                            SizedBox(height: 16.dp),
                            CustomTextfieldWidget(
                              controller: controller.passwordController,
                              hint: 'Enter your password',
                              validator: AppValidators.password,
                              labelText: 'Password',
                              obscureText: controller.obscurePassword.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.obscurePassword.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                                onPressed: controller.togglePasswordVisibility,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.dp),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomHyperlinkButton(
                          text: 'Forgot password?',
                          onTap: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.dp),
                      child: loginButton(
                        text: 'Login',
                        onTap: controller.onLoginTapped,
                      ),
                    ),
                  ],
                ),
              ),
              _buildSocialPanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialPanel() {
    return CustomPaint(
      painter: LoginBackgroundPainter(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.dp, 80.dp, 24.dp, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(child: Divider(color: Colors.white54)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.dp),
                  child: CustomTextWidget(
                    text: 'or continue with',
                    textStyle: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                ),
                const Expanded(child: Divider(color: Colors.white54)),
              ],
            ),
            SizedBox(height: 20.dp),
            Obx(
              () => customSignInButton(
                buttonText: controller.isLoading.value
                    ? 'Signing in...'
                    : 'Continue with Google',
                onPressed: controller.isLoading.value
                    ? null
                    : controller.signInWithGoogle,
                icon: controller.isLoading.value
                    ? SizedBox(
                        width: 18.dp,
                        height: 18.dp,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Image.asset('assets/google_logo.png', height: 20.dp),
              ),
            ),
            SizedBox(height: 12.dp),
            customSignInButton(
              buttonText: 'Continue with Facebook',
              onPressed: () => Get.snackbar(
                'Coming Soon',
                'Soon we will launch this feature.',
                snackPosition: SnackPosition.BOTTOM,
              ),
              icon: Icon(
                Icons.facebook,
                color: const Color(0xFF1877F2),
                size: 22.dp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.dp),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  children: const [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton({
    required final String text,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.dp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
          gradient: AppColors.primaryGradient,
        ),
        child: CustomTextWidget(
          text: text,
          textStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget customSignInButton({
    required final String buttonText,
    Widget? icon,
    required void Function()? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 12.dp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: icon,
        label: CustomTextWidget(
          text: buttonText,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
