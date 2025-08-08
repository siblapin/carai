import 'package:flutter/material.dart';

import '../../models/form_sign_up.dart';
import '../../theme.dart';
import 'auth_login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checkBox = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60, bottom: 40),
                child: Center(child: Text('РЕГИСТРАЦИЯ')),
              ),
              FormSignUp(
                name: 'Имя',
                onCommentChanged: (String value) {},
              ),
              FormSignUp(
                name: 'Телефон',
                onCommentChanged: (String value) {},
              ),
              FormSignUp(
                name: 'Эл. почта',
                onCommentChanged: (String value) {},
              ),
              FormSignUp(
                name: 'Пароль',
                onCommentChanged: (String value) {},
              ),
              FormSignUp(
                name: 'Повторите пароль',
                onCommentChanged: (String value) {},
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (checkBox) {
                            checkBox = false;
                          } else {
                            checkBox = true;
                          }
                        });
                      },
                      child: Icon(checkBox
                          ? Icons.check_box
                          : Icons.check_box_outline_blank)),
                  const SizedBox(
                    width: 250,
                    child: Text(
                      'Я согласен с условиями пользовательского соглашения',
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: EnterButtonForm(
                  name: 'Зарегистрироваться',
                  colorsBackground: buttonColor,
                  sizeButton: 100,
                  p: '/AuthLoginPage',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
