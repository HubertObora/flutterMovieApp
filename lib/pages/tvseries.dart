// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../style.dart';

class TvSeries extends StatefulWidget {
  const TvSeries({Key? key}) : super(key: key);

  @override
  State<TvSeries> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Seriale',
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
