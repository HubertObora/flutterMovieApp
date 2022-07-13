// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movieapp/acountPages/registrationpage.dart';

import '../style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Wpisz login')),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Wpisz hasło')),
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
                    'Zaloguj się',
                    style: AppStyle.smallText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Nie masz konta?'),
            ),
            GestureDetector(
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegistrationPage()));
              }),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Zarejestruj się', style: AppStyle.smallText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
