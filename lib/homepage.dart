// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movieapp/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _listOfPages = [
    //MainPage(),
    //filmy(),
    //seriale()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
          backgroundColor: AppStyle.mainColor,
        ),
        //body: _listOfPages[_selectedIndex],
        appBar: AppBar(
          backgroundColor: AppStyle.secondColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'S K Y F L I X',
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppStyle.secondColor,
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.white60,
            selectedItemColor: Colors.white,
            onTap: _navigate,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV series'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Actors')
            ]));
  }
}
