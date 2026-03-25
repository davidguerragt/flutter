import 'package:maquetacion/features/accounts/domain/entities/account.dart';
import 'package:maquetacion/features/accounts/domain/entities/overdraft.dart';

class AccountWithOverdraft {
  final Account account;
  final Overdraft overdraft;

  AccountWithOverdraft({required this.account, required this.overdraft});
}
