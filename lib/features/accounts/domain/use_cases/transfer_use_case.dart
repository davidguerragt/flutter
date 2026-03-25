import 'package:maquetacion/features/accounts/domain/entities/account.dart';
import 'package:maquetacion/features/accounts/domain/entities/account_with_overdraft.dart';

class TransferUseCase {
  final dynamic transferRepository = dynamic;

  Future<bool> call({
    required Account fromAccount,
    required Account toAccount,
    required double amount,
  }) async {
    try {
      final accountWithOverdraft = await transferRepository.getAccountOverdraft(
        fromAccount,
      );

      if (amount > fromAccount.overdraftLimit) {
        return false;
      }
      if (!fromAccount.canTransfer) {
        return false;
      }
      fromAccount.transfer(amount, toAccount);
      return true;
    } catch (e) {
      // Handle transfer failure (e.g., log the error, show a message to the user)
      print('Transfer failed: $e');
      return false;
    }
  }
}
