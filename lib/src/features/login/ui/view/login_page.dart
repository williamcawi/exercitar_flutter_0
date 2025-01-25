import 'package:exercitar_0/src/core/validators.dart';
import 'package:exercitar_0/src/features/login/ui/bloc/login_bloc.dart';
import 'package:exercitar_0/src/features/login/ui/bloc/login_event.dart';
import 'package:exercitar_0/src/features/login/ui/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget with Validators {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameOrEmailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is LoginError) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Mensagem de erro:'),
              content: Text(state.message),
              actions: [
                ElevatedButton(onPressed: context.pop, child: Text('ok'))
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Entrar'),
        ),
        body: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return CircularProgressIndicator();
              }

              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        validator: validatorUsernameOrEmail,
                        decoration: InputDecoration(
                            labelText: 'Nome de usuário ou email'),
                        controller: usernameOrEmailController,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: validatorPassword,
                        decoration: InputDecoration(labelText: 'Senha'),
                        controller: passwordController,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              context.read<LoginBloc>().add(LoginUserEvent(
                                  usernameOrEmail:
                                      usernameOrEmailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: Text('entrar')),
                      ElevatedButton(
                          onPressed: () {
                            context.push('/SignUpPage');
                          },
                          child: Text('cadastrar'))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
