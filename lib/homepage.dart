// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cool_nav/cool_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/acountPages/accountdetails.dart';
import 'package:movieapp/pages/actors.dart';
import 'package:movieapp/pages/movies.dart';
import 'package:movieapp/pages/tvseries.dart';
import 'package:movieapp/style.dart';
import 'acountPages/loginpage.dart';
import 'package:get/get.dart';

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

  final List<Widget> _listOfPages = [Movies(), TvSeries(), Actors()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listOfPages[_selectedIndex],
      appBar: AppBar(
        backgroundColor: AppStyle.secondColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'S K Y W E B',
          style: AppStyle.ornamentText,
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: AppStyle.secondColor,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'S K Y W E B',
                    style: AppStyle.ornamentText,
                  ),
                ),
              )),
              ShowDrawer(),
              ListTile(
                leading: Icon(Icons.language),
                title: Text(
                  'change_language'.tr,
                  style: AppStyle.smallText,
                ),
                onTap: () {
                  //tu błąd (przeładowanie api)
                  if (Get.locale == Locale('pl', 'PL')) {
                    Get.updateLocale(Locale('en', 'US'));
                  } else {
                    Get.updateLocale(Locale('pl', 'PL'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SpotlightBottomNavigationBar(
        backgroundColor: AppStyle.secondColor,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        onTap: _navigate,
        items: [
          SpotlightBottomNavigationBarItem(
            icon: Icons.movie,
          ),
          SpotlightBottomNavigationBarItem(icon: Icons.tv),
          SpotlightBottomNavigationBarItem(icon: Icons.person)
        ],
      ),
    );
  }
}

class ShowDrawer extends StatelessWidget {
  const ShowDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            //sprawdzic czy nie null
            final user = FirebaseAuth.instance.currentUser!.email;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '${'sign_as'.tr}$user',
                    style: AppStyle.smallText,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'account'.tr,
                    style: AppStyle.smallText,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AccountDetails(),
                    ));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text(
                    'favorite'.tr,
                    style: AppStyle.smallText,
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Konto(),))
                  },
                ),
                ListTile(
                  leading: Icon(Icons.remove_red_eye),
                  title: Text(
                    'watched'.tr,
                    style: AppStyle.smallText,
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Konto(),))
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text(
                    'sign_out'.tr,
                    style: AppStyle.smallText,
                  ),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'unlogged'.tr,
                    style: AppStyle.smallText,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'login_logout'.tr,
                    style: AppStyle.smallText,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                  },
                ),
              ],
            );
          }
        }));
  }
}
