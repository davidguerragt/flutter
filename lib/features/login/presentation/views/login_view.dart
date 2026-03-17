import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:maquetacion/core/assets.dart';
import 'package:maquetacion/core/environment/env.dart';
import 'package:maquetacion/features/login/presentation/widgets/social_widget.dart';
import 'package:maquetacion/l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Env.appName)),
      body: ListView(
        children: [Image.asset(Assets.loginBackground), BodyWidget()],
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text(
                AppLocalizations.of(context)!.welcome,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Text(
                //'Forgot password?',
                AppLocalizations.of(context)!.forgot_password,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF006FFD),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
                ),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.notAMember),
                  Image.asset(Assets.loginBackground, width: 16, height: 16),
                  InkWell(
                    onTap: () {
                      print('Navigate to registration page');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.registerNow,
                      style: TextStyle(
                        color: Color(0xFF006FFD),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: RichText(
              //     text: TextSpan(
              //       text: AppLocalizations.of(context)!.notAMember,
              //       style: TextStyle(color: Colors.black, fontSize: 14),
              //       children: [
              //         TextSpan(
              //           text: AppLocalizations.of(context)!.registerNow,
              //           recognizer: TapGestureRecognizer()
              //             ..onTap = () {
              //               print('Navigate to registration page');
              //             },
              //           style: TextStyle(
              //             color: Color(0xFF006FFD),
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.continueWith,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              SocialRow(),
            ],
          ),
        );
      },
    );
  }
}

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialWidget.google(),
        SizedBox(width: 12),
        SocialWidget.apple(),
        SizedBox(width: 12),
        SocialWidget.facebook(),
      ],
    );
  }
}
