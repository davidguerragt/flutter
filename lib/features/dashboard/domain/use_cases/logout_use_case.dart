import 'package:maquetacion/core/dependencies.dart';
import 'package:maquetacion/features/dashboard/data/repositories/logout_repository_impl.dart';
import 'package:maquetacion/features/dashboard/domain/repositories/logout_repository.dart';

class LogoutUseCase {
  final LogoutRepository _logoutRepository;

  LogoutUseCase({LogoutRepository? logoutRepository})
    : _logoutRepository = logoutRepository ?? getIt<LogoutRepositoryImpl>();

  Future<void> call() async {
    // Lógica adicional antes de cerrar sesión, si es necesario
    return _logoutRepository.logOut();
  }
}
