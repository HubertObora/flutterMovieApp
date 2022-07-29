// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movieapp/style/style.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'S K Y W E B',
              style: AppStyle.ornamentText,
            ),
          )
        ],
      ),
    );
  }
}
