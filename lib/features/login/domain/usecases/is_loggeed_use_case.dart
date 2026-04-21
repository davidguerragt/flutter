import 'package:maquetacion/features/login/data/repositories/authentication_repository_impl.dart';
import 'package:maquetacion/features/login/domain/repositories/authentication_repository.dart';

class IsLoggeedUseCase {
  final AuthenticationRepository _authenticationRepository;

  IsLoggeedUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();

  Future<bool> call() async {
    return _authenticationRepository.isSignedIn();
  }
}
