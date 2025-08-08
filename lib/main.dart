import 'package:flutter/material.dart';
import 'page/auth_login_page/account_settings.dart';
import 'page/auth_login_page/auth_login_page.dart';
import 'page/auth_login_page/login_page.dart';
import 'page/auth_login_page/sign_up_page.dart';
import 'page/user_card_page.dart';
import 'splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const CarAI());
}

class CarAI extends StatelessWidget {
  const CarAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SplashScreen();
          }

          return const AuthLoginPage();
        },
      ),
      routes: {
        '/AuthLoginPage': (context) => const AuthLoginPage(),
        '/SignUp': (context) => const SignUp(),
        '/LoginPage': (context) => const LoginPage(),
        '/UserCardPage': (context) => const UserCardPage(),
        '/AccountSettings': (context) => const AccountSettings(),
      },
      theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: backgroundColor,
          //   focusColor: Colors.orange, // цвет фона текстового поля
          hintColor: backgroundColor),
    );
  }
}
