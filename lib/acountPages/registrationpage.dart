// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../style.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _loginController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'S K Y F L I X',
                style: AppStyle.ornamentText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Wpisz login')),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Wpisz hasło')),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Wpisz email')),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: AppStyle.secondColor,
                    textStyle: AppStyle.smallText),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child: Text(
                    'Zarejestruj się',
                    style: AppStyle.smallText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
