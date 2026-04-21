import 'package:flutter/material.dart';
import 'package:maquetacion/features/login/domain/usecases/login_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginProvider({LoginUseCase? loginUseCase})
    : _loginUseCase = loginUseCase ?? LoginUseCase();

  String title = "Login";
  bool logged = false;

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    title = 'Iniciando sesión...';
    try {
      final user = await _loginUseCase.call(email, password);
      title = 'Bienvenido, ${user.name}';
      logged = true;
      notifyListeners();
      return true;
    } catch (e) {
      title = 'Error de login';
      logged = false;
      notifyListeners();
      return false;
    }
  }

  void loginWithFacebook() {
    notifyListeners();
  }

  void checkIfLogged() {
    title = 'Checking login...';
    notifyListeners();
  }
}
