import 'package:go_router/go_router.dart';
import 'package:maquetacion/features/accounts/presentation/states/credit_request_provider.dart';
import 'package:maquetacion/features/accounts/presentation/views/credit_request_view.dart';
import 'package:maquetacion/features/dashboard/views/dashboard_view.dart';
//import 'package:maquetacion/features/accounts/views/transfer_view.dart';
import 'package:maquetacion/features/login/presentation/state/login_provider.dart';
import 'package:maquetacion/features/login/presentation/views/login_view.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.login,
      path: '/',
      builder: (context, state) => ChangeNotifierProvider<LoginProvider>(
        create: (_) => LoginProvider(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      name: Routes.dashboard,
      path: '/dashboard',
      builder: (context, state) => DashboardView(),
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
      ],
    ),
  ],
);

abstract class Routes {
  static const String login = 'login';
  static const String dashboard = 'dashboard';
  static const String creditRequest = 'solicitud-credito';
}
