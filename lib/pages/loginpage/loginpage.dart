// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/registrationpage/registrationpage.dart';
import 'package:movieapp/pages/homepage/homepage.dart';
import 'package:get/get.dart';
import 'package:movieapp/services/firebase_service/firebase_service.dart';
import 'package:movieapp/widgets/textfield.dart';
import '../../style/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  text: 'E-mail',
                  icon: Icon(Icons.person),
                  controller: _emailController),
              TxtFieldPassword(
                  text: 'password'.tr,
                  icon: Icon(Icons.lock),
                  controller: _passwordController),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: () {
                    signIn();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppStyle.secondColor,
                      textStyle: AppStyle.smallText),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: Text(
                      'log_in'.tr,
                      style: AppStyle.smallText,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('have_account?'.tr),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationPage()));
                }),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('register'.tr, style: AppStyle.smallText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    try {
      await FirebaseService.signIn(
          _emailController.text.trim(), _passwordController.text.trim());
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
    } catch (_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error_while_login'.tr)));
    }
  }
}
