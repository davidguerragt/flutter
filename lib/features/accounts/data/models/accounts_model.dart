class NewAccountModel {
  final String accountNumber;
  final String accountType;
  final String accountName;
  final double? balance;

  NewAccountModel({
    required this.accountNumber,
    required this.accountType,
    required this.accountName,
    required this.balance,
  });

  factory NewAccountModel.fromJson(Map<String, dynamic> json) {
    return NewAccountModel(
      accountNumber: json['accountNumber'],
      accountType: json['accountType'],
      accountName: json['accountName'],
      balance: json['balance'],
    );
  }
}

class NewAccountsModel {
  final List<NewAccountModel> accounts;
  final accountJSON = {
    "accounts": [
      {
        "accountNumber": "123456789",
        "accountType": "Checking",
        "accountName": "Main Checking",
        "balance": 1500.75,
      },
      {
        "accountNumber": "987654321",
        "accountType": "Savings",
        "accountName": "Emergency Fund",
        "balance": 5000.00,
      },
      {
        "accountNumber": "555555555",
        "accountType": "Credit",
        "accountName": "Visa Credit Card",
        "balance": -250.00,
      },
      {
        "accountNumber": "111222333",
        "accountType": "Investment",
        "accountName": "Retirement Account",
        "balance": 20000.00,
      },
    ],
  };

  NewAccountsModel({required this.accounts});

  factory NewAccountsModel.fromJson(Map<String, dynamic> json) {
    var accountsJson = json['accounts'] as List;
    List<NewAccountModel> accountsList = accountsJson
        .map((account) => NewAccountModel.fromJson(account))
        .toList();
    return NewAccountsModel(accounts: accountsList);
  }
}
