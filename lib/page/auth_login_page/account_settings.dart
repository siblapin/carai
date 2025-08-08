import 'package:flutter/material.dart';

import '../../theme.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  Map<String, String> userData = {
    'ФАМИЛИЯ': 'пусто',
    'ИМЯ': 'пусто',
    'ОТЧЕСТВО': 'пусто',
    'ДАТА РОЖДЕНИЯ': 'пусто',
    'ГОРОД': 'пусто',
    'АДРЕС РЕГИСТРАЦИИ': 'пусто',
    'АДРЕС ПРОЖИВАНИЯ': 'пусто',
    'ТЕЛЕФОН': '${'+7 '}пусто',
    'ЭЛ. ПОЧТА': 'пусто',
  };

  // Функция для обновления данных
  void updateData(String key, String newValue) {
    setState(() {
      userData[key] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "МОИ ДАННЫЕ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: buttonColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.orange),
                    width: 100,
                    height: 100,
                    child: const Icon(Icons.account_box),
                  )
                ],
              ),
              const SizedBox(height: 30),
              InfoAccountModel(
                nameInfo: 'ФАМИЛИЯ',
                name: userData['ФАМИЛИЯ']!,
                onUpdate: (newValue) => updateData('ФАМИЛИЯ', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'ИМЯ',
                name: userData['ИМЯ']!,
                onUpdate: (newValue) => updateData('ИМЯ', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'ОТЧЕСТВО',
                name: userData['ОТЧЕСТВО']!,
                onUpdate: (newValue) => updateData('ОТЧЕСТВО', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'ДАТА РОЖДЕНИЯ',
                name: userData['ДАТА РОЖДЕНИЯ']!,
                onUpdate: (newValue) => updateData('ДАТА РОЖДЕНИЯ', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'ГОРОД',
                name: userData['ГОРОД']!,
                onUpdate: (newValue) => updateData('ГОРОД', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'АДРЕС РЕГИСТРАЦИИ',
                name: userData['АДРЕС РЕГИСТРАЦИИ']!,
                onUpdate: (newValue) =>
                    updateData('АДРЕС РЕГИСТРАЦИИ', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'АДРЕС ПРОЖИВАНИЯ',
                name: userData['АДРЕС ПРОЖИВАНИЯ']!,
                onUpdate: (newValue) =>
                    updateData('АДРЕС ПРОЖИВАНИЯ', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'ТЕЛЕФОН',
                name: userData['ТЕЛЕФОН']!,
                onUpdate: (newValue) => updateData('ТЕЛЕФОН', newValue),
              ),
              InfoAccountModel(
                nameInfo: 'ЭЛ. ПОЧТА',
                name: userData['ЭЛ. ПОЧТА']!,
                onUpdate: (newValue) => updateData('ЭЛ. ПОЧТА', newValue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoAccountModel extends StatefulWidget {
  const InfoAccountModel({
    super.key,
    required this.nameInfo,
    required this.name,
    required this.onUpdate,
  });
  final String nameInfo;
  final String name;
  final Function(String) onUpdate;

  @override
  State<InfoAccountModel> createState() => _InfoAccountModelState();
}

class _InfoAccountModelState extends State<InfoAccountModel> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.nameInfo,
                    style: TextStyle(
                        color: Colors.orange[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _alertDialogInfo(context, widget.nameInfo);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.orange[200],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _alertDialogInfo(BuildContext context, String nameInfo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFE0E7F0),
          title: const Text('Редактирование', style: TextStyle(fontSize: 16)),
          content: SizedBox(
            height: 70,
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: nameInfo,
                    border: const OutlineInputBorder(),
                  ),
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
                widget.onUpdate(_controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
