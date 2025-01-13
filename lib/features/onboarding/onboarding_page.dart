import 'package:booking_app_frontend/common/constants/app_colors.dart';
import 'package:booking_app_frontend/common/constants/app_text_styles.dart';
import 'package:booking_app_frontend/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        children: [
          const SizedBox(height: 48.0),
          Expanded(
            child: Image.asset(
              'assets/images/man.png',
            ),
          ),
          Text(
            'Spend Smarter',
            style: AppTextStyles.mediumText36.copyWith(
              color: AppColors.greenOne,
            ),
          ),
          Text(
            'Save More',
            style: AppTextStyles.mediumText36.copyWith(
              color: AppColors.greenOne,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 16.0,
              bottom: 4.0,
            ),
            child: PrimaryButton(
              text: 'Get Started',
              onPressed: () {},
            ),
          ),
          Text(
            'Already have account? Sign In',
            style: AppTextStyles.smallText.copyWith(
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 24.0)
        ],
      ),
    );
  }
}
