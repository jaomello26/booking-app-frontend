import 'package:booking_app_frontend/features/sign_in/sign_in_state.dart';
import 'package:booking_app_frontend/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  SignInState _state = SignInStateInitial();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doSignIn({
    required String email,
    required String password,
  }) async {
    _changeState(SignInStateLoading());

    try {
      await _service.signIn(
        email: email,
        password: password,
      );

      _changeState(SignInStateSuccess());
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}
