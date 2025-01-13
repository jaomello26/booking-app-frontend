import 'package:booking_app_frontend/common/constants/app_colors.dart';
import 'package:booking_app_frontend/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Text(
          "kazero",
          style: AppTextStyles.bigText50.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
