// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/style/style.dart';
import '../../services/firebase_service/firebase_service.dart';
import '../homepage/homepage.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseService.auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'S K Y W E B',
          style: AppStyle.ornamentText,
        ),
        backgroundColor: AppStyle.secondColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline_sharp,
              size: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Login: ${user!.email}',
                style: AppStyle.normalText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'joined'.tr +
                    user.metadata.creationTime.toString().substring(0, 11),
                style: AppStyle.normalText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: AppStyle.secondColor,
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  onPressed: () {
                    //dokonczyc
                  },
                  child: Text(
                    'change_password'.tr,
                    style: AppStyle.normalText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: AppStyle.secondColor,
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  onPressed: () {
                    FirebaseService.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(
                    'sign_out'.tr,
                    style: AppStyle.normalText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: AppStyle.secondColor,
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  onPressed: () {
                    // dokonczyc
                  },
                  child: Text(
                    'delete_account'.tr,
                    style: AppStyle.normalRedText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: AppStyle.secondColor,
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  onPressed: () {
                    // dokonczyc
                  },
                  child: Text(
                    'about_version'.tr,
                    style: AppStyle.normalText,
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
