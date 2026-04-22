import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:core/assets.dart';
import 'package:maquetacion/app_colors.dart';
import 'package:maquetacion/core/environment/env.dart';
import 'package:maquetacion/core/local_storage.dart';
import 'package:maquetacion/core/navigation/router.dart';
import 'package:maquetacion/core/utils/my_bloc_observer.dart';
import 'package:maquetacion/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.initialize();
  await LocalStorage().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Env.appName,
      theme: ThemeData(primaryColor: AppColors.primaryColor),

      supportedLocales: [Locale('en', 'us'), Locale('es', 'ES')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
    );
  }
}
