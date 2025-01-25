import 'package:exercitar_0/src/core/validators.dart';
import 'package:exercitar_0/src/features/signUp/ui/bloc/sign_up_bloc.dart';
import 'package:exercitar_0/src/features/signUp/ui/bloc/sign_up_event.dart';
import 'package:exercitar_0/src/features/signUp/ui/bloc/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget with Validators {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(SnackBar(content: Text(state.message)));
          context.go('/LoginPage');
        }
        if (state is SignUpError) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('mensagem de erro:'),
                    content: Text(state.message),
                    actions: [
                      ElevatedButton(onPressed: context.pop, child: Text('ok'))
                    ],
                  ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar'),
        ),
        body: Center(
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoading) {
                return CircularProgressIndicator();
              }

              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 35,
                    children: [
                      TextFormField(
                        validator: validatorUsername,
                        controller: usernameController,
                        decoration:
                            InputDecoration(labelText: 'nome de usuário'),
                      ),
                      TextFormField(
                        validator: validatorEmail,
                        controller: emailController,
                        decoration: InputDecoration(labelText: 'email'),
                      ),
                      TextFormField(
                        validator: validatorPassword,
                        controller: passwordController,
                        decoration: InputDecoration(labelText: 'senha'),
                      ),
                      TextFormField(
                        validator: (value) => validatorConfirmPassword(
                            value, passwordController.text),
                        controller: confirmPasswordController,
                        decoration:
                            InputDecoration(labelText: 'confirmar senha'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              context.read<SignUpBloc>().add(SignUpUserEvent(
                                  username: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
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
