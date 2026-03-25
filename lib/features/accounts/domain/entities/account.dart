import 'package:maquetacion/core/const.dart';
import 'package:maquetacion/core/utils/string_extensions.dart';
import 'package:maquetacion/features/accounts/data/models/account_model.dart';

enum AccountType { checking, savings, credit, investment, loan }

class Account {
  final String userId;
  final AccountType accountType;
  final String accountId;
  final double balance;
  final double overdraftLimit = 0.0;

  bool isLocked = false;

  bool get canTransfer => balance > 0 && !isLocked && isExchangeType;

  bool get isExchangeType {
    return accountType == AccountType.savings ||
        accountType == AccountType.checking;
  }

  bool get isOverdraftAllowed {
    return overdraftLimit > 0 && accountType == AccountType.checking;
  }

  // int get overdraftLimit {
  //   switch (accountType) {
  //     case AccountType.checking:
  //       return (balance * Consts.overDraftLimitPercentage).toInt();
  //     default:
  //       return 0; // No overdraft allowed for other account types
  //   }
  // }

  Account({
    required this.userId,
    required this.accountType,
    required this.accountId,
    this.balance = Consts.defaultAccountBalance,
  });

  factory Account.fromModel({required AccountModel model}) {
    return Account(
      userId: model.userId,
      accountType: model.accountType.toAccountType,
      accountId: model.accountId,
      balance: model.balance ?? Consts.defaultAccountBalance,
    );
  }

  void transfer(double amount, Account toAccount) {
    switch (this.accountType) {
      case AccountType.checking:
        // Implement checking account transfer logic
        throw UnimplementedError();
      case AccountType.savings:
        // Implement savings account transfer logic
        break;
      case AccountType.credit:
        // Implement credit account transfer logic
        throw UnimplementedError();
      case AccountType.investment:
        // Implement investment account transfer logic
        throw UnimplementedError();
      case AccountType.loan:
        // Implement loan account transfer logic
        throw UnimplementedError();
    }
  }
}
