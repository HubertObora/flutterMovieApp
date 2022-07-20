// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movieapp/style.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movieapp/keys/keys.dart';
import 'package:get/get.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  List trendingMovies = [];
  List topRatedMovies = [];
  List popukarMovies = [];

  void loadMovies() async {
    TMDB tmdb = TMDB(ApiKeys(apikey, accesKey),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdb.v3.trending.getTrending();
    Map topRatedResult = await tmdb.v3.movies.getTopRated();
    Map popularResult = await tmdb.v3.movies.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      popukarMovies = popularResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieText(text: 'hello'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: trendingMovies),
              ),
              MovieText(text: 'Popularne Filmy'),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: popukarMovies),
              ),
              MovieText(text: 'Najwyżej oceniane Filmy'),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: topRatedMovies),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.listOfMovies})
      : super(key: key);
  final List listOfMovies;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: listOfMovies.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Container(
            height: size.height / 3.0,
            width: size.width / 3.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppStyle.secondColor, width: 4),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${listOfMovies[index]['poster_path']}',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MovieText extends StatelessWidget {
  const MovieText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 0, 0),
      child: Text(
        text,
        style: AppStyle.mainText,
      ),
    );
  }
}
