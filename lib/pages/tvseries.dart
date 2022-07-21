// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/details.dart';
import 'package:movieapp/style.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movieapp/keys/keys.dart';
import 'package:get/get.dart';

class TvSeries extends StatefulWidget {
  const TvSeries({Key? key}) : super(key: key);

  @override
  State<TvSeries> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  List topRatedMovies = [];
  List popularMovies = [];
  List nowPlayingMovies = [];
  List upcomingMovies = [];

  void loadMovies() async {
    String locale = 'en';
    if (Get.locale == Locale('pl', 'PL')) {
      locale = 'pl';
    } else {
      locale = 'en';
    }
    TMDB tmdb = TMDB(ApiKeys(apikey, accesKey),
        defaultLanguage: locale,
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map topRatedResult = await tmdb.v3.tv.getTopRated(page: 2);
    Map popularResult = await tmdb.v3.tv.getPopular(page: 1);
    Map nowPlayingResult = await tmdb.v3.tv.getAiringToday(page: 4);
    Map upcomingResult = await tmdb.v3.tv.getOnTheAir(page: 3);
    setState(() {
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
              MovieText(text: 'popular_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
                child: TrendingMovies(listOfMovies: popularMovies),
              ),
              MovieText(text: 'top_rated_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
                child: TrendingMovies(listOfMovies: topRatedMovies),
              ),
              MovieText(text: 'airing_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
                child: TrendingMovies(listOfMovies: nowPlayingMovies),
              ),
              MovieText(text: 'ontheair_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
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
                    isFilm: false,
                  ),
                ),
              );
            },
            child: Container(
              height: size.height / 4.0,
              width: size.width / 1.8,
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
