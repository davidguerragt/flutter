import 'package:flutter/material.dart';
import 'package:session_3/core/assets.dart';

class TransferViewModel {
  final String fromAccount;
  final String toAccount;
  final double amount;

  TransferViewModel({
    required this.fromAccount,
    required this.toAccount,
    required this.amount,
  });
}

class TransferView extends StatelessWidget {
  const TransferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transfer')),
      body: ListView(
        children: [Image.asset(Assets.loginBackground), TransferBody()],
      ),
    );
  }
}

class TransferBody extends StatelessWidget {
  const TransferBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Transfer View'),
        const SizedBox(height: 16),
        const Text('This is where you can transfer funds between accounts.'),
        const SizedBox(height: 16),
        const Text('Account From:'),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter source account',
          ),
        ),
        const Text('Account To:'),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter destination account',
          ),
        ),
        const Text('Amount:'),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter amount',
          ),
        ),
        const SizedBox(height: 16),
        const SendButton(),
      ],
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},

      child: const Text('Transfer Funds'),
    );
  }
}
