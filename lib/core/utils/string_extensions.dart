import 'package:maquetacion/features/accounts/domain/entities/account.dart';

extension AccountTypeExtension on String {
  AccountType get toAccountType {
    switch (this) {
      case 'checking':
        return AccountType.checking;
      case 'savings':
        return AccountType.savings;
      case 'credit':
        return AccountType.credit;
      case 'investment':
        return AccountType.investment;
      case 'loan':
        return AccountType.loan;
      default:
        throw Exception('Unknown account type: $this');
    }
  }
}
