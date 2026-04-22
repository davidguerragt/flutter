import 'package:session_3/features/accounts/domain/entities/account.dart';

AccountType toAccountType(String accountType) {
  switch (accountType) {
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
      throw Exception('Unknown account type: $accountType');
  }
}
