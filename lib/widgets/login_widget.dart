import 'package:cfp_front/consumers/auth_consumer.dart';
import 'package:cfp_front/models/login_credentials_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final LoginCredentials _loginCredentials = LoginCredentials();

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 500,
      height: 400,
      child: Card(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              spacing: 18,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /// Text
                const Text(
                  'Entre para continuar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// Email
                TextFormField(
                  onChanged: (final String value) =>
                      _loginCredentials.email = value,
                  validator: (final String? value) =>
                      value == null || value.isEmpty
                          ? 'Email is required'
                          : null,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),

                /// Password
                TextFormField(
                  validator: (final String? value) =>
                      value == null || value.isEmpty
                          ? 'Password is required'
                          : null,
                  onChanged: (final String value) =>
                      _loginCredentials.password = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),

                /// Login
                ElevatedButton.icon(
                  onPressed: () async {
                    final bool result =
                        await AuthConsumer().login(_loginCredentials);

                    if (result) {
                      if (context.mounted) {
                        GoRouter.of(context).goNamed('home');
                      }
                      return;
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuário ou senha inválidos'),
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Padding(
                    padding: EdgeInsets.all(18),
                    child: Text('Entrar'),
                  ),
                ),

                /// Register
                TextButton(
                  onPressed: () => GoRouter.of(context).goNamed('register'),
                  child: const Text('Não tem uma conta? Registre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
