import 'package:booking_app_frontend/common/constants/routes.dart';
import 'package:booking_app_frontend/common/themes/default_theme.dart';
import 'package:booking_app_frontend/features/sign_in/sign_in_page.dart';
import 'package:booking_app_frontend/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'package:booking_app_frontend/features/onboarding/onboarding_page.dart';
import 'package:booking_app_frontend/features/sign_up/sign_up_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().defaultTheme,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
      },
    );
  }
}
