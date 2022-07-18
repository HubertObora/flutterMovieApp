// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'S K Y W E B',
                  style: AppStyle.ornamentText,
                ),
              ),
              TxtField(
                  text: 'Login',
                  icon: Icon(Icons.person),
                  controller: _loginController),
              TxtField(
                  text: 'Hasło',
                  icon: Icon(Icons.lock),
                  controller: _passwordController),
              TxtField(
                  text: 'E-mail',
                  icon: Icon(Icons.email),
                  controller: _emailController),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: signUp,
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Masz już konto?'),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).pop();
                }),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Zaloguj się',
                    style: AppStyle.smallText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Konto zostało założone!"),
            content: Text('Teraz możesz się zalogować'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error!"),
            content: Text(e.message.toString()),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Błąd podczas próby rejestracji')));
    }
  }
}

class TxtField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  const TxtField(
      {Key? key,
      required this.text,
      required this.icon,
      required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: text, prefixIcon: icon)),
    );
  }
}
