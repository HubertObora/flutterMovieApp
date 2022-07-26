import 'package:get/get.dart';
import 'package:movieapp/models/actors/actor_data.dart';
import 'package:movieapp/models/actors/actor_details_data.dart';
import 'package:movieapp/models/movies/film_details_data.dart';
import 'package:movieapp/models/tvseries/tvseries_data.dart';
import 'package:movieapp/models/tvseries/tvseries_details_data.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../../keys/keys.dart';
import '../../models/movies/film_data.dart';

class NetworkService {
  late TMDB tmdb;
  static String urlToPhoto = 'https://image.tmdb.org/t/p/w500';
  NetworkService() {
    tmdb = TMDB(ApiKeys(apikey, accesKey),
        defaultLanguage: Get.locale!.toLanguageTag(),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
  }

  // movies

  Future<List<FilmData>> getTrendingMovies() async {
    Map<String, dynamic> response =
        await tmdb.v3.trending.getTrending() as Map<String, dynamic>;
    return List<FilmData>.from(
        response['results'].map((films) => FilmData.fromJson(films)));
  }

  Future<List<FilmData>> getPopularMovies() async {
    Map<String, dynamic> response =
        await tmdb.v3.movies.getPopular() as Map<String, dynamic>;
    return List<FilmData>.from(
        response['results'].map((films) => FilmData.fromJson(films)));
  }

  Future<List<FilmData>> getTopRatedMovies() async {
    Map<String, dynamic> response =
        await tmdb.v3.movies.getTopRated() as Map<String, dynamic>;
    return List<FilmData>.from(
        response['results'].map((films) => FilmData.fromJson(films)));
  }

  Future<List<FilmData>> getNowPlayingMovies() async {
    Map<String, dynamic> response =
        await tmdb.v3.movies.getNowPlaying() as Map<String, dynamic>;
    return List<FilmData>.from(
        response['results'].map((films) => FilmData.fromJson(films)));
  }

  Future<List<FilmData>> getUpcomingMovies() async {
    Map<String, dynamic> response =
        await tmdb.v3.movies.getUpcoming() as Map<String, dynamic>;
    return List<FilmData>.from(
        response['results'].map((films) => FilmData.fromJson(films)));
  }

  //movie details

  Future<FilmDetailsData> getMovieDetails(int movieId) async {
    Map<String, dynamic> response =
        await tmdb.v3.movies.getDetails(movieId) as Map<String, dynamic>;
    return FilmDetailsData.fromJson(response);
  }

  //tv series

  Future<List<TvseriesData>> getTopRatedTvseries() async {
    Map<String, dynamic> response =
        await tmdb.v3.tv.getTopRated(page: 2) as Map<String, dynamic>;
    return List<TvseriesData>.from(
        response['results'].map((films) => TvseriesData.fromJson(films)));
  }

  Future<List<TvseriesData>> getPopularTvseries() async {
    Map<String, dynamic> response =
        await tmdb.v3.tv.getPopular() as Map<String, dynamic>;
    return List<TvseriesData>.from(
        response['results'].map((films) => TvseriesData.fromJson(films)));
  }

  Future<List<TvseriesData>> getAiringTvseries() async {
    Map<String, dynamic> response =
        await tmdb.v3.tv.getAiringToday() as Map<String, dynamic>;
    return List<TvseriesData>.from(
        response['results'].map((films) => TvseriesData.fromJson(films)));
  }

  Future<List<TvseriesData>> getOnTheAirTvseries() async {
    Map<String, dynamic> response =
        await tmdb.v3.tv.getOnTheAir() as Map<String, dynamic>;
    return List<TvseriesData>.from(
        response['results'].map((films) => TvseriesData.fromJson(films)));
  }

  //tvseries details

  Future<TvseriesDetailsData> getTvseriesDetails(int movieId) async {
    Map<String, dynamic> response =
        await tmdb.v3.tv.getDetails(movieId) as Map<String, dynamic>;
    return TvseriesDetailsData.fromJson(response);
  }

  //actors

  Future<List<ActorData>> getPopularActors() async {
    Map<String, dynamic> response =
        await tmdb.v3.people.getPopular() as Map<String, dynamic>;
    return List<ActorData>.from(
        response['results'].map((films) => ActorData.fromJson(films)));
  }

  Future<ActorDetailsData> getActorDetails(int movieId) async {
    Map<String, dynamic> response =
        await tmdb.v3.people.getDetails(movieId) as Map<String, dynamic>;
    return ActorDetailsData.fromJson(response);
  }
}
