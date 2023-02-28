import 'package:flutter/material.dart';
import 'package:login_users/screen/Auth.dart';
import 'package:login_users/screen/login.dart';
import 'package:login_users/screen/register.dart';
import 'package:provider/provider.dart';

import 'providers/user.provider.dart';
import 'screen/Dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/auth': (BuildContext context) => const Auth(),
        '/login': (BuildContext context) => const Login(),
        '/register': (BuildContext context) => const Register(),
        '/dashboard': (BuildContext context) => ChangeNotifierProvider(
          create: (context) => User(),
          child: const Dashboard(title: 'Dashboard'),
        ),
      },
    );
  }
}