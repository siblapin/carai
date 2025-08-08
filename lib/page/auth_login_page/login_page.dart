import 'package:flutter/material.dart';

import '../../models/form_sign_up.dart';
import '../../theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const LogoCarAI(),
                    const SizedBox(height: 50),
                    const Text('Вы не авторизованы'),
                    const SizedBox(height: 10),
                    FormSignUp(
                      name: 'Телефон',
                      onCommentChanged: (String value) {},
                    ),
                    FormSignUp(
                      name: 'Пароль',
                      onCommentChanged: (String value) {},
                    ),
                    const SizedBox(height: 10),
                    EnterButtonForm(
                      name: "Войти",
                      colorsBackground: buttonColor,
                      sizeButton: 200,
                      p: "/UserCardPage",
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/SignUp'),
                      child: const SizedBox(
                          height: 50, child: Text('Регистрация')),
                    ),
                    GestureDetector(
                      onTap: () {
                        _alertDialogFunc(context);
                      },
                      child: const Text('Напомнить пароль'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _alertDialogFunc(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFE0E7F0),
          title: const Text('Восстановление пароля'),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                const Text('Введите ваш email или телефон для восстановления.'),
                FormSignUp(
                  name: 'Телефон',
                  onCommentChanged: (String value) {},
                ),
                FormSignUp(
                  name: 'Эл.почта',
                  onCommentChanged: (String value) {},
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отправить'),
            ),
          ],
        );
      },
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
