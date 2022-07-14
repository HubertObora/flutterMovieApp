// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../style.dart';

class Actors extends StatefulWidget {
  const Actors({Key? key}) : super(key: key);

  @override
  State<Actors> createState() => _ActorsState();
}

class _ActorsState extends State<Actors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Aktorzy',
                style: AppStyle.mainText,
                textAlign: TextAlign.right,
              ),
            ),
          )
        ],
      ),
    );
  }
}
