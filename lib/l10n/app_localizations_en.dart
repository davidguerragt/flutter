// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'My Banking App';

  @override
  String get forgot_password => 'forgot_password?';

  @override
  String get login => 'Login';

  @override
  String get balance => 'Available balance';

  @override
  String get transfer => 'Trnsfer';

  @override
  String get insufficient_funds => 'Insufficient funds';

  @override
  String get generic_error => 'An error ocurred. Please try again';

  @override
  String get welcome => 'Welcome!';

  @override
  String get notAMember => 'Not a member?';

  @override
  String get registerNow => 'Register Now';

  @override
  String get continueWith => 'Or continue with...';

  @override
  String get email => 'Email Address';

  @override
  String get password => 'Password';
}
