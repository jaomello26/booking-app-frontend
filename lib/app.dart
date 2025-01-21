import 'package:flutter/material.dart';

import 'package:booking_app_frontend/features/onboarding/onboarding_page.dart';
import 'package:booking_app_frontend/features/sign_up/sign_up_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
    );
  }
}
