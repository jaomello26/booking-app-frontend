import 'package:booking_app_frontend/common/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signIn({
    required String email,
    required String password,
  });
}
