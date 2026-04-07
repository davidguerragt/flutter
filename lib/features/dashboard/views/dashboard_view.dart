import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maquetacion/core/navigation/router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.creditRequest);
              },
              child: Text('Crédito'),
            ),
          ],
        ),
      ),
    );
  }
}
