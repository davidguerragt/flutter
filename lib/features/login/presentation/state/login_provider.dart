import 'package:flutter/material.dart';
import 'package:maquetacion/features/login/domain/usecases/login_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginProvider({LoginUseCase? loginUseCase})
    : _loginUseCase = loginUseCase ?? LoginUseCase();

  String title = "Login";

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    title = 'Iniciando sesión...';
    try {
      final user = await _loginUseCase.call(email, password);
      title = 'Bienvenido, ${user.name}';
      notifyListeners();
    } catch (e) {
      title = 'Error de login';
      notifyListeners();
      return;
    }
  }

  void loginWithFacebook() {
    notifyListeners();
  }
}
