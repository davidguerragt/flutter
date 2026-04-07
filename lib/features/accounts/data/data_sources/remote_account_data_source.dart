import 'package:maquetacion/features/accounts/data/models/accounts_model.dart';

class RemoteAccountDataSource {
  Future<List<NewAccountModel>> getAccounts() async {
    // Implementa la lógica para obtener las cuentas desde una fuente de datos remota (API, etc.)
    // Devuelve una lista de objetos Account
    final response = await Future.delayed(
      Duration(seconds: 2),
      () => [
        {
          "accountNumber": "123456789",
          "accountType": "Checking",
          "accountName": "John Doe's Checking Account",
          "balance": 1500.00,
        },
        {
          "accountNumber": "987654321",
          "accountType": "Savings",
          "accountName": "John Doe's Savings Account",
          "balance": 5000.00,
        },
        {
          "accountNumber": "555555555",
          "accountType": "Credit",
          "accountName": "John Doe's Credit Card",
          "balance": -250.00,
        },
        {
          "accountNumber": "111222333",
          "accountType": "Investment",
          "accountName": "John Doe's Retirement Account",
          "balance": 20000.00,
        },
      ],
    );
    return response.map((e) => NewAccountModel.fromJson(e)).toList();
  }
}
