import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maquetacion/core/assets.dart';
import 'package:maquetacion/core/navigation/router.dart';
import 'package:maquetacion/features/collections/presentation/state/collection_provider.dart';
import 'package:maquetacion/features/collections/presentation/widgets/network_widget.dart';
import 'package:provider/provider.dart';
//import 'package:maquetacion/l10n/app_localizations.dart';

class CollectionViewModel {
  final String companyName;
  final String referenceNumber;
  final String password;

  CollectionViewModel({
    required this.companyName,
    required this.referenceNumber,
    required this.password,
  });
}

class Network {
  final String name;
  final String logo;

  Network({required this.name, required this.logo});
}

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recharge')),
      body: ListView(children: [BodyWidget()]),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});
  final String title = "Add Mobile Number";

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late bool showPassword;
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

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
    showPassword = false;
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
    final state = context.watch<CollectionProvider>();
    final int selectedNetworkIndex = state.itemSelected;
    final TextEditingController mobileNumber = TextEditingController(
      text: '+502 5834-5117',
    );
    final TextEditingController amountController = TextEditingController(
      text: '250.00',
    );

    double selectedAmount = 250.0;

    final List<double> amounts = [50, 100, 150, 250];

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
              const Text('Enter recipient mobile number'),
              const SizedBox(height: 16),
              // Email field
              TextField(
                controller: mobileNumber,
                decoration: InputDecoration(
                  hintText:
                      'Mobile Number', //AppLocalizations.of(context)!.email,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Select Network'),
              const SizedBox(height: 16),
              //const NetworkRow(),
              Scrollbar(
                thumbVisibility: true,
                thickness: 8.0,
                radius: const Radius.circular(15),
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    itemCount: networks.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedNetworkIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            state.setItemSelected(index);
                          });

                          String name = networks[index].name;
                          print('item seleccionado $index - $name');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(12),
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(networks[index].logo, height: 50),
                              const SizedBox(height: 8),
                              Text(
                                networks[index].name,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Password field with visibility toggle
              const SizedBox(height: 16),

              TextField(
                controller: amountController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  prefixText: '\$',
                  suffixText: 'USD',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.8,
                ),
                itemCount: amounts.length,
                itemBuilder: (context, index) {
                  final amount = amounts[index];
                  final isSelected = amount == selectedAmount;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAmount = amount;
                        amountController.text = amount.toStringAsFixed(2);
                        state.setAmount(amount);
                      });
                    },
                    child: _AmountButton(
                      amount: amount,
                      isSelected: isSelected,
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  double varAmount =
                      double.tryParse(amountController.text) ?? 0.0;
                  state.setItemSelected(selectedNetworkIndex);
                  state.setMobileNumber(mobileNumber.text);
                  state.setAmount(varAmount);
                  context.goNamed(
                    Routes.collectionConfirmation,
                    extra: context.read<CollectionProvider>(),
                  );
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
      'Add Mobile Number',
      //AppLocalizations.of(context)!.welcome,
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class NetworkRow extends StatelessWidget {
  const NetworkRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NetworkWidget.att(),
        SizedBox(width: 12),
        NetworkWidget.tmobile(),
        SizedBox(width: 12),
        NetworkWidget.verizon(),
        SizedBox(width: 12),
        NetworkWidget.cox(),
        SizedBox(width: 12),
        NetworkWidget.movistar(),
        SizedBox(width: 12),
        NetworkWidget.claro(),
      ],
    );
  }
}

class _AmountButton extends StatelessWidget {
  final double amount;
  final bool isSelected;

  const _AmountButton({required this.amount, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Text(
        '\$${amount.toInt()}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
