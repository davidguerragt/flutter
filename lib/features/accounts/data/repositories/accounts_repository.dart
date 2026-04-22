import 'package:session_3/features/accounts/data/data_sources/remote_account_data_source.dart';
import 'package:session_3/features/accounts/data/models/accounts_model.dart';
import 'package:session_3/features/accounts/domain/repositories/account_repository.dart';

class AccountsRepositoryImpl implements AccountRepository {
  final RemoteAccountDataSource _remoteAccountsDataSource;

  AccountsRepositoryImpl({RemoteAccountDataSource? remoteAccountsDataSource})
    : _remoteAccountsDataSource =
          remoteAccountsDataSource ?? RemoteAccountDataSource();
  @override
  Future<List<NewAccountModel>> getAccounts() async {
    // Implementa la lógica para obtener las cuentas desde una fuente de datos (API, base de datos, etc.)
    // Devuelve una lista de objetos Account
    return _remoteAccountsDataSource.getAccounts();
  }
}
