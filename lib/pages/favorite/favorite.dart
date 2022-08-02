import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/style.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondColor,
        centerTitle: true,
        title: Text('favorite'.tr),
      ),
    );
  }
}
