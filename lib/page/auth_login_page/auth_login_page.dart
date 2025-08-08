import 'package:flutter/material.dart';
import '../../theme.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const LogoCarAI(),
              const SizedBox(height: 100),
              const Text('Вы не авторизованы'),
              const SizedBox(height: 10),
              EnterButtonForm(
                name: "Войти",
                colorsBackground: buttonColor,
                sizeButton: 200,
                p: "/LoginPage",
              ),
              EnterButtonForm(
                name: "Зарегестрироваться",
                colorsBackground: buttonColor,
                sizeButton: 200,
                p: '/SignUp',
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

class EnterButtonForm extends StatelessWidget {
  const EnterButtonForm(
      {super.key,
      required this.name,
      required this.colorsBackground,
      required this.sizeButton,
      required this.p});
  final String name;
  final Color? colorsBackground;
  final double sizeButton;
  final String p;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: sizeButton,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(colorsBackground)),
          onPressed: () {
            Navigator.of(context).pushNamed(p);
          },
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}

class LogoCarAI extends StatelessWidget {
  const LogoCarAI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/carai.png',
      width: 300,
      height: 300,
      fit: BoxFit.fitHeight,
    );
  }
}
