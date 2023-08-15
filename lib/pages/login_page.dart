import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc_example_auth/auth_bloc/auth_event.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 5,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Welcome Login')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                //membaca AuthBloc kemudian akan menjalankan Login Event
                context.read<AuthBloc>().add(LoginEvent());
              },
              child: Text('Login'))
        ],
      ),
    );
  }
}
