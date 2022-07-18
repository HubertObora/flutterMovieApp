// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movieapp/style.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movieapp/keys/keys.dart';

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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Trendujące Filmy',
                  style: AppStyle.mainText,
                ),
              ),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: trendingMovies),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Popularne Filmy',
                  style: AppStyle.mainText,
                ),
              ),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: popukarMovies),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Najwyżej oceniane Filmy',
                  style: AppStyle.mainText,
                ),
              ),
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
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            height: size.height / 3,
            width: size.width / 3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
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
