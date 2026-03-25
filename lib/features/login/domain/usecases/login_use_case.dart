import 'package:maquetacion/features/login/data/repositories/authentication_repository_impl.dart';
import 'package:maquetacion/features/login/domain/entities/user.dart';
import 'package:maquetacion/features/login/domain/repositories/authentication_repository.dart';

class LoginUseCase {
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();

  Future<User> call(String email, String password) async {
    // Aquí iría la lógica real de autenticación, como una llamada a una API.
    // Por simplicidad, vamos a simular un login exitoso si el usuario es "admin" y la contraseña es "password".
    return await _authenticationRepository.singInWithEmailAndPassword(
      email,
      password,
    );
  }
}
