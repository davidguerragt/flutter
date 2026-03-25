import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final int balance;

  const AccountWidget({required this.balance, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Balance: ${balance}'));
  }
}
