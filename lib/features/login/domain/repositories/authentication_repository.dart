import 'package:maquetacion/features/login/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUserEmail();
  Future<bool> logout();
  Future<bool> registerWithEmailAndPassword(String email, String password);
  Future<String> getAccessToken();
  Future<User> singInWithEmailAndPassword(String email, String password);
}
