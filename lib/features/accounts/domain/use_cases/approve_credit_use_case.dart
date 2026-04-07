import 'package:maquetacion/features/accounts/domain/entities/credit_result.dart';
import 'package:maquetacion/features/accounts/domain/services/calculate_credit_amount_service.dart';



class ApproveCreditUseCase {
  final dynamic transferRepository = dynamic;

  Future<CreditResult> call({dynamic creditApplication}) async {
    if (creditApplication == 'approved') {
      final score = await transferRepository.getCreditScore(
        creditApplication.userId,
      );

      final payCapacity = await transferRepository.getPayCapacity(
        creditApplication.userId,
      );

      final creditAmount = calculateCreditAmount(
        score: score,
        payCapacity: payCapacity,
      );

      if (creditAmount > 0) {
        return CreditResult.approved(amount: creditAmount);
      } else {
        return CreditResult.denied();
      }
    } else {
      return CreditResult.denied();
    }
  }
}
