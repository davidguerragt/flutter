class CreditResult {
  final bool approved;
  final double amount;

  CreditResult({required this.approved, required this.amount});

  factory CreditResult.approved({required double amount}) {
    return CreditResult(approved: true, amount: amount);
  }

  factory CreditResult.denied() {
    return CreditResult(approved: false, amount: 0.0);
  }
}
