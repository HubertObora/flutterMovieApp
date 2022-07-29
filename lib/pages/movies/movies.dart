//ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movies/film_data.dart';
import 'package:movieapp/pages/movies/moviedetails.dart';
import 'package:movieapp/services/tmdb_network_service/network_service.dart';
import 'package:movieapp/services/tmdb_repository_service/repository_serive.dart';
import 'package:movieapp/style/style.dart';
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

  List<FilmData> listOfTrendingMovies = [],
      listOfPopularMovies = [],
      listOfTopRatedMovies = [],
      listOfNowPlayingMovies = [],
      listOfUpcomingMovies = [];

  Future loadMovies() async {
    listOfTrendingMovies = await RepositoryService.getTrendingMovies();
    listOfPopularMovies = await RepositoryService.getPopularMovies();
    listOfTopRatedMovies = await RepositoryService.getTopRatedMovies();
    listOfNowPlayingMovies = await RepositoryService.getNowPlayingMovies();
    listOfUpcomingMovies = await RepositoryService.getUpcomingMovies();
    setState(() {});
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
                child: TrendingMovies(listOfMovies: listOfTrendingMovies),
              ),
              MovieText(text: 'popular_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: listOfPopularMovies),
              ),
              MovieText(text: 'top_rated_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: listOfTopRatedMovies),
              ),
              MovieText(text: 'now_playing_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: listOfNowPlayingMovies),
              ),
              MovieText(text: 'upcoming_movies'.tr),
              SizedBox(
                height: size.height * 0.25,
                child: TrendingMovies(listOfMovies: listOfUpcomingMovies),
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
  final List<FilmData> listOfMovies;
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(
                    id: listOfMovies[index].id,
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
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    NetworkService.urlToPhoto + listOfMovies[index].posterPath!,
                placeholder: (context, url) => Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
