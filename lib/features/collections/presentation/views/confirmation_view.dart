import 'package:flutter/material.dart';
import 'package:maquetacion/core/assets.dart';
import 'package:maquetacion/features/collections/presentation/state/collection_provider.dart';
import 'package:maquetacion/features/collections/presentation/views/collection_view.dart';
import 'package:provider/provider.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmation')),
      body: ListView(children: [BodyWidget()]),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});
  final String title = "Are you sure ?";

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final networks = [
    Network(name: 'AT&T', logo: Assets.attIcon),
    Network(name: 'T-Mobile', logo: Assets.tmobileIcon),
    Network(name: 'Verizon', logo: Assets.verizonIcon),
    Network(name: 'COX', logo: Assets.coxIcon),
    Network(name: 'Movistar', logo: Assets.movistarIcon),
    Network(name: 'Claro', logo: Assets.claroIcon),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('BodyWidget dependencies changed');
  }

  @override
  void deactivate() {
    print('BodyWidget deactivated');
    super.deactivate();
  }

  @override
  void dispose() {
    print('BodyWidget disposed');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BodyWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<CollectionProvider>();
    final selectedNetworkIndex = state.itemSelected;
    final mobileNumber = state.mobileNumber;
    final amount = state.amount;
    final Network network = networks[selectedNetworkIndex];
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600
                ? (constraints.maxWidth - 600) / 2 + 24
                : 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderWidget(),
              const Text(
                'Please make sure that you want to Recharge your mobile',
              ),
              const SizedBox(height: 16),
              TransactionCard(
                collector: network,
                mobileNumber: mobileNumber,
                amount: amount,
              ),
              const SizedBox(height: 16),
              TextField(
                //controller: passwordController,
                decoration: InputDecoration(
                  prefixText: '\$',
                  hintText: '250.00', //AppLocalizations.of(context)!.password,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  print('Item selected $selectedNetworkIndex');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
                ),
                child: Text(
                  'Continue', //AppLocalizations.of(context)!.login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //LoginButton(),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Are you sure?',
      //AppLocalizations.of(context)!.welcome,
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.collector,
    required this.mobileNumber,
    required this.amount,
  });
  final Network collector;
  final String mobileNumber;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // LOGO
            SizedBox(
              height: 50,
              child: Image.asset(
                collector.logo,
                //'assets/att_logo.png', // tu asset
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 12),

            // TITULO
            Text(
              collector.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            // SUBTITULO
            Text(
              mobileNumber,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 12),

            // BADGE
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Transactions Status: Pending',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),

            const SizedBox(height: 20),

            // MONTO
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\$',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  TextSpan(
                    text: amount.toStringAsFixed(2), // '\$50.00',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' USD',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // INFO ROWS
            _InfoRow(label: 'Network', value: collector.name),
            const SizedBox(height: 8),
            _InfoRow(label: 'Transfer Fee', value: '\$ $amount USD'),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
