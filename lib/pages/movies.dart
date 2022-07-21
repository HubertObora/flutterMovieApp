// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/details.dart';
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
  List popularMovies = [];
  List nowPlayingMovies = [];
  List upcomingMovies = [];
  void loadMovies() async {
    TMDB tmdb = TMDB(ApiKeys(apikey, accesKey),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdb.v3.trending.getTrending(page: 1);
    Map topRatedResult = await tmdb.v3.movies.getTopRated(page: 2);
    Map popularResult = await tmdb.v3.movies.getPopular(page: 3);
    Map nowPlayingResult = await tmdb.v3.movies.getNowPlaying(page: 4);
    Map upcomingResult = await tmdb.v3.movies.getUpcoming(page: 5);
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      popularMovies = popularResult['results'];
      nowPlayingMovies = nowPlayingResult['results'];
      upcomingMovies = upcomingResult['results'];
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
              MovieText(text: 'trending_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: trendingMovies),
              ),
              MovieText(text: 'popular_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: popularMovies),
              ),
              MovieText(text: 'top_rated_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: topRatedMovies),
              ),
              MovieText(text: 'now_playing_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: nowPlayingMovies),
              ),
              MovieText(text: 'upcoming_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: upcomingMovies),
              ),
              SizedBox(
                height: 10,
              )
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
          child: GestureDetector(
            onTap: () {
              int filmId = listOfMovies[index]['id'];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(
                    id: filmId,
                    isFilm: true,
                  ),
                ),
              );
            },
            child: Container(
              height: size.height / 3.0,
              width: size.width / 3.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppStyle.secondColor, width: 4)),
              //tu błąd podczas ładowania zdjęć
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${listOfMovies[index]['poster_path']}',
                placeholder: (context, url) =>
                    Center(child: Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        );
        //    } else {
        //   return Icon(Icons.error);
        // }
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
