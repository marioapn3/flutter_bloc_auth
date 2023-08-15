import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_auth/pages/home_page.dart';
import 'package:flutter_bloc_example_auth/pages/login_page.dart';

import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
              )),
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              //ketika loading maka muncul
              if (state is AuthLoading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              //ketika sukses maka berpindah
              if (state is AuthSuccess) {
                return const HomePage();
              }
              //kalau tidak melakukan apa2 maka tetep di login
              return const Login();
            },
          )),
    );
  }
}
