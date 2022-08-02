import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/style/style.dart';

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondColor,
        centerTitle: true,
        title: Text('to_watch'.tr),
      ),
    );
  }
}
