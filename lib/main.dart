import 'package:flutter/material.dart';
//import 'package:core/assets.dart';
import 'package:maquetacion/app_colors.dart';
import 'package:maquetacion/core/environment/env.dart';
import 'package:maquetacion/features/login/presentation/views/login_view.dart';
import 'package:maquetacion/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Env.appName,
      theme: ThemeData(primaryColor: AppColors.primaryColor),
      home: const LoginView(),
      supportedLocales: [Locale('en', 'us'), Locale('es', 'ES')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
