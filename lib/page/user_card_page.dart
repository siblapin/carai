import 'package:flutter/material.dart';

import '../theme.dart';

class UserCardPage extends StatelessWidget {
  const UserCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const AppBarPage(),
          const ReklamaUserPage(),
          const SizedBox(height: 20),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: GridView.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  children: const [
                    BottomUserPageModelForm(
                        name: 'Мои авто',
                        colorsBottomUserPageModelForm: Colors.green),
                    BottomUserPageModelForm(
                        name: 'CARAI CONNECT CC',
                        colorsBottomUserPageModelForm: Colors.blue),
                    BottomUserPageModelForm(
                        name: 'CARAI Все для авто',
                        colorsBottomUserPageModelForm: Colors.blueAccent),
                    BottomUserPageModelForm(
                        name: 'CARAI журнал',
                        colorsBottomUserPageModelForm: Colors.orangeAccent),
                    BottomUserPageModelForm(
                        name: 'AI помощник',
                        colorsBottomUserPageModelForm: Colors.red),
                    BottomUserPageModelForm(
                        name: 'CARAI Навигатор/Карты',
                        colorsBottomUserPageModelForm: Colors.lightGreen),
                  ]),
            ),
          ))
        ],
      )),
    );
  }
}

class AppBarPage extends StatelessWidget {
  const AppBarPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "CARAI",
          style: TextStyle(
              color: buttonColor, fontSize: 34, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/AccountSettings'),
            child: Icon(Icons.account_box, color: buttonColor, size: 40))
      ]),
    );
  }
}

class ReklamaUserPage extends StatelessWidget {
  const ReklamaUserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ReklamaModelForm(),
          ReklamaModelForm(),
          ReklamaModelForm(),
          ReklamaModelForm(),
          ReklamaModelForm(),
          ReklamaModelForm(),
          ReklamaModelForm(),
        ],
      ),
    );
  }
}

class ReklamaModelForm extends StatelessWidget {
  const ReklamaModelForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
          color: buttonColor,
          width: 150,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Баннеры с рекламой и акциями',
              overflow: TextOverflow.clip,
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}

class BottomUserPageModelForm extends StatelessWidget {
  const BottomUserPageModelForm(
      {super.key,
      required this.name,
      required this.colorsBottomUserPageModelForm});
  final String name;
  final Color colorsBottomUserPageModelForm;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
              color: colorsBottomUserPageModelForm,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(Icons.photo_outlined)
              ],
            ),
          )),
    );
  }
}
