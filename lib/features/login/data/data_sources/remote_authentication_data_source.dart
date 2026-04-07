import 'package:maquetacion/features/login/data/models/user_model.dart';
import 'package:maquetacion/features/login/data/models/user_password_model.dart';

class RemoteAuthenticationDataSource {
  Future<UserModel> singInWithEmailAndPassword(
    UserPasswordModel userPasswordModel,
  ) async {
    final email = userPasswordModel.email;
    final password = userPasswordModel.password;
    // Simulamos una llamada a una API que devuelve un usuario si el email y la contraseña son correctos.
    await Future.delayed(
      Duration(seconds: 2),
    ); // Simula el tiempo de respuesta de la API

    if (email == "dguerra" && password == "1234567") {
      return UserModel(
        id: "123",
        name: "John Doe",
        email: "dguerra@correo.com",
      );
    } else {
      throw Exception("Error al iniciar sesión. Credenciales inválidas.");
    }
  }
}
