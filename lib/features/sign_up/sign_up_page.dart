import 'package:flutter/material.dart';

import 'package:booking_app_frontend/common/constants/app_colors.dart';
import 'package:booking_app_frontend/common/constants/app_text_styles.dart';
import 'package:booking_app_frontend/common/utils/uppercase_text_formatter.dart';
import 'package:booking_app_frontend/common/utils/validator.dart';
import 'package:booking_app_frontend/common/widgets/custom_circular_progress_indicator.dart';
import 'package:booking_app_frontend/common/widgets/custom_text_form_field.dart';
import 'package:booking_app_frontend/common/widgets/multi_text_button.dart';
import 'package:booking_app_frontend/common/widgets/password_form_field.dart';
import 'package:booking_app_frontend/common/widgets/primary_button.dart';
import 'package:booking_app_frontend/features/sign_up/sign_up_controller.dart';
import 'package:booking_app_frontend/features/sign_up/sign_up_state.dart';
import 'package:booking_app_frontend/services/mock_auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignUpController(MockAuthService());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpStateLoading) {
        showDialog(
          context: context,
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      }

      if (_controller.state is SignUpStateSuccess) {
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

      if (_controller.state is SignUpStateError) {
        final error = _controller.state as SignUpStateError;
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
            'Spend Smarter',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText36.copyWith(
              color: AppColors.greenOne,
            ),
          ),
          Text(
            'Save More',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText36.copyWith(
              color: AppColors.greenOne,
            ),
          ),
          Image.asset(
            'assets/images/sign_up_image.png',
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: "your name",
                  hintText: "JOHN DOE",
                  inputFormatters: [
                    UpperCaseTextInputFormatter(),
                  ],
                  validator: Validator.validateName,
                ),
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
                  helperText: "Must have at least 8 characters, 1 capital letter and 1 number.",
                ),
                PasswordFormField(
                  labelText: "confirm your password",
                  hintText: "*********",
                  validator: (value) => Validator.validateConfirmPassword(
                    _passwordController.text,
                    value,
                  ),
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
              text: 'Sign Up',
              onPressed: () {
                final valid = _formKey.currentState != null && _formKey.currentState!.validate();

                if (valid) {
                  _controller.doSignUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () {},
            children: [
              Text(
                'Already have account? ',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                'Sign In ',
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
