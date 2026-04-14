import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maquetacion/features/accounts/presentation/states/credit_request_provider.dart';
import 'package:maquetacion/features/accounts/presentation/views/credit_request_view.dart';
import 'package:maquetacion/features/collections/presentation/state/collection_provider.dart';
import 'package:maquetacion/features/collections/presentation/views/collection_view.dart';
import 'package:maquetacion/features/collections/presentation/views/confirmation_view.dart';
import 'package:maquetacion/features/dashboard/views/dashboard_view.dart';
//import 'package:maquetacion/features/accounts/views/transfer_view.dart';
import 'package:maquetacion/features/login/presentation/state/login_provider.dart';
import 'package:maquetacion/features/login/presentation/views/login_view.dart';
import 'package:maquetacion/features/profile/presentation/views/dawshboard_view.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.collectionPayBill,
      path: '/',
      builder: (context, state) => ChangeNotifierProvider<CollectionProvider>(
        create: (_) => CollectionProvider(),
        child: const CollectionView(),
      ),
    ),

    ShellRoute(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          title: Text('Enyoi Bank'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Expanded(flex: 70, child: child),
            Expanded(flex: 10, child: Container(color: Colors.orange)),
            Expanded(flex: 10, child: Container(color: Colors.red)),
          ],
        ),
      ),
      routes: [
        GoRoute(
          name: Routes.creditRequest,
          path: 'solicitud-credito',
          builder: (context, state) =>
              ChangeNotifierProvider<CreditRequestProvider>(
                create: (_) => CreditRequestProvider(),
                child: CreditRequestView(),
              ),
        ),
        GoRoute(
          name: Routes.profile,
          path: '/profile',
          builder: (context, state) => ProfileView(),
        ),
        GoRoute(
          name: Routes.collectionConfirmation,
          path: '/confirmation',
          builder: (context, state) {
            final provider = state.extra as CollectionProvider;
            return ChangeNotifierProvider.value(
              value: provider,
              child: ConfirmationView(),
            );
          },
        ),
        // GoRoute(
        //   name: Routes.collectionPayBill,
        //   path: '/collections-pay-bill',
        //   builder: (context, state) => CollectionView(),
        // ),
      ],
    ),
  ],
);

abstract class Routes {
  static const String login = 'login';
  static const String dashboard = 'dashboard';
  static const String creditRequest = 'solicitud-credito';
  static const String profile = 'profile';
  static const String collectionPayBill = 'collections-pay-bill';
  static const String collectionConfirmation = 'collectdion-confirmation';
}
