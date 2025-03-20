import 'package:cfp_front/consumers/auth_consumer.dart';
import 'package:cfp_front/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
///
///
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

///
///
///
class _RegisterViewState extends State<RegisterView> {
  final UserModel _user = UserModel();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                spacing: 18,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /// Text
                  const Text(
                    'Registre-se para submeter um artigo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// Name and Last Name
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          validator: (final String? string) {
                            if (string == null || string.isEmpty) {
                              return 'Nome é obrigatório';
                            }
                            return null;
                          },
                          onChanged: (final String value) =>
                              _user.firstName = value,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (final String? string) {
                            if (string == null || string.isEmpty) {
                              return 'Sobrenome é obrigatório';
                            }
                            return null;
                          },
                          onChanged: (final String value) =>
                              _user.lastName = value,
                          decoration: const InputDecoration(
                            labelText: 'Sobrenome',
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Email
                  TextFormField(
                    validator: (final String? string) {
                      if (string == null || string.isEmpty) {
                        return 'Email é obrigatório';
                      }

                      if (!emailRegex.hasMatch(string)) {
                        return 'Email inválido';
                      }

                      return null;
                    },
                    onChanged: (final String value) => _user.email = value,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),

                  /// Username
                  TextFormField(
                    validator: (final String? string) {
                      if (string == null || string.isEmpty) {
                        return 'Nome de usuário é obrigatório';
                      }
                      return null;
                    },
                    onChanged: (final String value) => _user.username = value,
                    decoration: const InputDecoration(
                      labelText: 'Nome de usuário',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),

                  /// Password
                  TextFormField(
                    validator: (final String? string) {
                      if (string == null || string.isEmpty) {
                        return 'Senha é obrigatória';
                      }
                      return null;
                    },
                    onChanged: (final String value) => _user.password = value,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),

                  /// Register button
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final bool result =
                            await AuthConsumer().register(_user);

                        if (result) {
                          GoRouter.of(context).goNamed('submit');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Olá! ${_user.firstName}, faça login '
                                      'para continuar.'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Erro ao criar usuário'),
                            ),
                          );
                        }
                      } else {
                        print('Invalid form');
                      }
                    },
                    icon: const Icon(Icons.person_add),
                    label: Padding(
                      padding: const EdgeInsets.all(12),
                      child: const Text('Registrar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
