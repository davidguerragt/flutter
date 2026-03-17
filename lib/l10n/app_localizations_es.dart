// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_title => 'Mi aplicación de Banco';

  @override
  String get forgot_password => 'Olvidaste la contraseña?';

  @override
  String get login => 'Acceder';

  @override
  String get balance => 'Saldo disponible';

  @override
  String get transfer => 'Trnsferir';

  @override
  String get insufficient_funds => 'Fondos insuficientes';

  @override
  String get generic_error => 'Ocurrió un error. Por favor intenta de nuevo';

  @override
  String get welcome => 'Bienvenido!';

  @override
  String get notAMember => 'No estas registrado?';

  @override
  String get registerNow => 'Regístrate ahora';

  @override
  String get continueWith => 'O continúa con...';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get password => 'Contraseña';
}
