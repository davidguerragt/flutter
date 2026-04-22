import 'package:flutter/material.dart';
import 'package:session_3/core/assets.dart';

class Network {
  final String name;
  final String logo;

  Network({required this.name, required this.logo});
}

class NetworkWidget extends StatelessWidget {
  NetworkWidget({
    super.key,
    required this.color,
    required this.imageAsset,
    required this.name,
  });

  final Color color;
  final String imageAsset;
  final String name;
  final selectedNetworkIndex = 1; // T-Mobile seleccionado por defecto

  final networks = [
    Network(name: 'AT&T', logo: Assets.attIcon),
    Network(name: 'T-Mobile', logo: Assets.tmobileIcon),
    Network(name: 'Verizon', logo: Assets.verizonIcon),
    Network(name: 'COX', logo: Assets.coxIcon),
    Network(name: 'Movistar', logo: Assets.movistarIcon),
    Network(name: 'Claro', logo: Assets.claroIcon),
  ];

  factory NetworkWidget.att() {
    return NetworkWidget(
      color: Colors.red,
      imageAsset: Assets.attIcon,
      name: 'AT&T',
    );
  }

  factory NetworkWidget.tmobile() {
    return NetworkWidget(
      color: Colors.black,
      imageAsset: Assets.tmobileIcon,
      name: 'T-Mobile',
    );
  }

  factory NetworkWidget.verizon() {
    return NetworkWidget(
      color: Colors.blue,
      imageAsset: Assets.verizonIcon,
      name: 'Verizon',
    );
  }

  factory NetworkWidget.cox() {
    return NetworkWidget(
      color: Colors.orange,
      imageAsset: Assets.coxIcon,
      name: 'COX',
    );
  }

  factory NetworkWidget.movistar() {
    return NetworkWidget(
      color: Colors.green,
      imageAsset: Assets.movistarIcon,
      name: 'Movistar',
    );
  }

  factory NetworkWidget.claro() {
    return NetworkWidget(
      color: Colors.green,
      imageAsset: Assets.claroIcon,
      name: 'Claro',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: networks.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedNetworkIndex;

          return GestureDetector(
            onTap: () {
              // setState(() {
              //   selectedNetworkIndex = index;
              // });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imageAsset, height: 30),
                  SizedBox(height: 8),
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
    );
  }
}
