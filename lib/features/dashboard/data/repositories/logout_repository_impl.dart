import 'package:maquetacion/features/dashboard/data/data_sources/local_logout_datasource.dart';
import 'package:maquetacion/features/dashboard/domain/repositories/logout_repository.dart';
import 'package:maquetacion/core/dependencies.dart';

class LogoutRepositoryImpl extends LogoutRepository {
  final LocalLogoutDatasource _localLogoutDatasource;

  LogoutRepositoryImpl({LocalLogoutDatasource? localLogoutDatasource})
    : _localLogoutDatasource =
          localLogoutDatasource ?? getIt<LocalLogoutDatasource>();

  @override
  Future<void> logOut() async {
    await _localLogoutDatasource.clearSession();
  }
}
