import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/utilities/show_error_snackbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showSnackBar(
                context, 'No account found with that email. Please sign up.');
          } else if (state.exception is WrongPasswordAuthException) {
            await showSnackBar(
                context, 'Incorrect password. Please try again.');
          } else if (state.exception is GenericAuthException) {
            await showSnackBar(
                context, 'An unexpected error occurred. Please try again.');
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            await showSnackBar(context,
                'This email is already registered. Please use a different email.');
          } else if (state.exception is UserDisabledAuthException) {
            await showSnackBar(context,
                'This account has been disabled. Please contact support.');
          } else if (state.exception is TooManyRequestsAuthException) {
            await showSnackBar(
                context, 'Too many login attempts. Please try again later.');
          } else if (state.exception is OperationNotAllowedAuthException) {
            await showSnackBar(context,
                'This operation is not allowed. Please contact support.');
          } else if (state.exception is InvalidEmailAuthException) {
            await showSnackBar(context,
                'The email address is not valid. Please check and try again.');
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: 'Enter your Email here'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your Password here'),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                context.read<AuthBloc>().add(
                      AuthEventLogIn(
                        email,
                        password,
                      ),
                    );
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(const AuthEventForgotPassword());
              },
              child: const Text('Forgot Password?'),
            ),
            TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        const AuthEventShouldRegister(),
                      );
                },
                child: const Text('Not registered yet? Sign up here.'))
          ],
        ),
      ),
    );
  }
}
