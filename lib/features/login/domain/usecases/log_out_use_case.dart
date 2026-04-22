import 'package:session_3/features/login/domain/repositories/authentication_repository.dart';

class LogOutUsecase {
  final AuthenticationRepository _authenticationRepository;

  LogOutUsecase(this._authenticationRepository);

  Future<void> call() async {
    // Implement the logic to log out the user here
    // This could involve clearing user data, tokens, etc.

    return await _authenticationRepository.signOut();
  }
}
