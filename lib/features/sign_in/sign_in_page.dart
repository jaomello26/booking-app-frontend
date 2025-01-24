import 'package:booking_app_frontend/common/constants/routes.dart';
import 'package:flutter/material.dart';

import 'package:booking_app_frontend/common/constants/app_colors.dart';
import 'package:booking_app_frontend/common/constants/app_text_styles.dart';
import 'package:booking_app_frontend/common/utils/validator.dart';
import 'package:booking_app_frontend/common/widgets/custom_circular_progress_indicator.dart';
import 'package:booking_app_frontend/common/widgets/custom_text_form_field.dart';
import 'package:booking_app_frontend/common/widgets/multi_text_button.dart';
import 'package:booking_app_frontend/common/widgets/password_form_field.dart';
import 'package:booking_app_frontend/common/widgets/primary_button.dart';
import 'package:booking_app_frontend/features/sign_in/sign_in_controller.dart';
import 'package:booking_app_frontend/features/sign_in/sign_in_state.dart';
import 'package:booking_app_frontend/services/mock_auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignInController(MockAuthService());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInStateLoading) {
        showDialog(
          context: context,
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      }

      if (_controller.state is SignInStateSuccess) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text("Next Screen"),
              ),
            ),
          ),
        );
      }

      if (_controller.state is SignInStateError) {
        final error = _controller.state as SignInStateError;
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Welcome Back!',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText36.copyWith(
              color: AppColors.greenOne,
            ),
          ),
          Image.asset(
            'assets/images/sign_in_image.png',
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: "your email",
                  hintText: "john@email.com",
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: "choose your password",
                  hintText: "*********",
                  validator: Validator.validatePassword,
                ),
              ],
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
              text: 'Sign In',
              onPressed: () {
                final valid = _formKey.currentState != null && _formKey.currentState!.validate();

                if (valid) {
                  _controller.doSignIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                NamedRoute.signUp,
              );
            },
            children: [
              Text(
                'Don`t have account? ',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                'Sign Up',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenOne,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
