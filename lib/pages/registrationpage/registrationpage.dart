import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/services/firebase_service/firebase_service.dart';
import 'package:movieapp/widgets/textfield.dart';
import '../../style/style.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _loginController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

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
                  icon: const Icon(Icons.person),
                  controller: _loginController),
              TxtFieldPassword(
                  text: 'password'.tr,
                  icon: const Icon(Icons.lock),
                  controller: _passwordController),
              TxtFieldPassword(
                  text: 'confirm_password'.tr,
                  icon: const Icon(Icons.lock),
                  controller: _passwordConfirmController),
              TxtField(
                  text: 'E-mail',
                  icon: const Icon(Icons.email),
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
                      'register'.tr,
                      style: AppStyle.smallText,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('have_account'.tr),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).pop();
                }),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'log_in'.tr,
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
    if (_passwordController.text.trim() ==
        _passwordConfirmController.text.trim()) {
      try {
        FirebaseService.signIn(
            _emailController.text.trim(), _passwordController.text.trim());
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('account_created'.tr),
              content: Text('now_log_in'.tr),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"),
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
              title: const Text("Error!"),
              content: Text(e.message.toString()),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          },
        );
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('error_while_register'.tr)));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('diffrent_passwords'.tr)));
    }
  }
}
