// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:movieapp/services/tmdb_network_service/network_service.dart';

class CustomSearchDelegate extends SearchDelegate {
  //Future loadSearch() async {
  //Map<String, dynamic> mapa = await NetworkService.multiSearch('aa');
  // try {
  //   List<FilmData>.from(
  //       a['results'].map((films) => FilmData.fromJson(films)));
  //   print('SUKCES');
  // } on Exception catch (e) {
  //   print('Błąd');
  // }
  // try {

  // }
  // if (List<ActorData>.from(
  //     mapa['results'].map((films) => ActorData.fromJson(films))).isNotEmpty) {
  //   print('dobrze');
  // } else {
  //   print('zle');
  // }
  // }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          //loadSearch();
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('as');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search'),
    );
  }
}
