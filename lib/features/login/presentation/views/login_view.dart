import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maquetacion/core/assets.dart';
import 'package:maquetacion/core/environment/env.dart';
import 'package:maquetacion/features/accounts/views/transfer_view.dart';
import 'package:maquetacion/features/login/presentation/state/login_provider.dart';
import 'package:maquetacion/features/login/presentation/widgets/social_widget.dart';
import 'package:maquetacion/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});
  final String title = "Login";

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late bool showPassword;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              const SizedBox(height: 16),
              // Email field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Password field with visibility toggle
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  border: OutlineInputBorder(),
                  suffixIcon: InkWell(
                    child: showPassword
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onTap: () {
                      showPassword = !showPassword;
                      print('Toggle password visibility: $showPassword');
                      setState(() {});
                    },
                  ),
                ),
                obscureText: !showPassword,
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
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  final logged = await context.read<LoginProvider>().login(
                    email,
                    password,
                  );

                  if (logged) {
                    context.go('/dashoard');
                  }
                  //TransferView();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
                ),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //LoginButton(),
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

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<LoginProvider>().updateTitle('Haciendo login');
        // Provider.of<LoginProvider>(
        //   context,
        //   listen: false,
        // ).updateTitle('Haciendo login');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
      ),
      child: Text(
        AppLocalizations.of(context)!.login,
        style: TextStyle(color: Colors.white),
      ),
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

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final title = Provider.of<LoginProvider>(context).title;
    final state = context.watch<LoginProvider>();
    final title = state.title;
    final logged = state.logged;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (logged) {
        // Navegar a otra pantalla
        context.go('/dashboard');
      }
    });

    return Text(
      title,
      //AppLocalizations.of(context)!.welcome,
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
