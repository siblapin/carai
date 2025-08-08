import 'package:flutter/material.dart';

import 'theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 83, 171, 243), Colors.orange],
          stops: [0.0, 2.0],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Привет, Добро пожаловать в CARAI',
              style: TextStyle(
                color: buttonColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70, left: 70),
              child: Image.asset(
                'assets/img/carai.png',
              ),
            ),
            CircularProgressIndicator(
              color: buttonColor,
            ),
          ],
        ),
      ),
    ));
  }
}
