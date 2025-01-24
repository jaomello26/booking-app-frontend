import 'package:booking_app_frontend/common/models/user_model.dart';
import 'package:booking_app_frontend/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      if (password.length < 6) {
        throw Exception();
      }

      return UserModel(
        id: email.hashCode,
        email: email,
        password: password,
      );
    } catch (e) {
      if (password.length < 6) {
        throw 'Password too short.';
      }

      throw 'Unable to login account. Please try again later.';
    }
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      if (password.length < 6) {
        throw Exception();
      }

      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
        password: password,
      );
    } catch (e) {
      if (password.length < 6) {
        throw 'Password too short.';
      }

      throw 'Unable to create account. Please try again later.';
    }
  }
}
