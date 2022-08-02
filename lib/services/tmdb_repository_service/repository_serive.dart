import 'package:movieapp/models/movies/film_details_data.dart';
import 'package:movieapp/services/tmdb_network_service/network_service.dart';

import '../../models/actors/actor_credits_data.dart';
import '../../models/actors/actor_data.dart';
import '../../models/actors/actor_details_data.dart';
import '../../models/actors/cast_inmoviedetails_data.dart';
import '../../models/actors/crew_inmoviedetails_data.dart';
import '../../models/movies/film_data.dart';
import '../../models/tvseries/tvseries_data.dart';
import '../../models/tvseries/tvseries_details_data.dart';

class RepositoryService {
  // getting movies
  static Future<List<FilmData>> getTrendingMovies() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getTrendingMoviesResponse();
      return List<FilmData>.from(
          response['results'].map((films) => FilmData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<FilmData>> getPopularMovies() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getPopularMoviesResponse();
      return List<FilmData>.from(
          response['results'].map((films) => FilmData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<FilmData>> getTopRatedMovies() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getTopRatedMoviesResponse();
      return List<FilmData>.from(
          response['results'].map((films) => FilmData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<FilmData>> getNowPlayingMovies() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getNowPlayingMoviesResponse();
      return List<FilmData>.from(
          response['results'].map((films) => FilmData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<FilmData>> getUpcomingMovies() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getUpcomingMoviesResponse();
      return List<FilmData>.from(
          response['results'].map((films) => FilmData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  //getting movie details
  static Future<FilmDetailsData?> getMovieDetails(int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getMovieDetailsResponse(movieId);
      return FilmDetailsData.fromJson(response);
    } catch (e) {
      return null;
    }
  }
  // getting tvseries

  static Future<List<TvseriesData>> getTopRatedTvseries() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getTopRatedTvseriesResponse();
      return List<TvseriesData>.from(
          response['results'].map((films) => TvseriesData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<TvseriesData>> getPopularTvseries() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getPopularTvseriesResponse();
      return List<TvseriesData>.from(
          response['results'].map((films) => TvseriesData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<TvseriesData>> getAiringTvseries() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getAiringTvseriesResponse();
      return List<TvseriesData>.from(
          response['results'].map((films) => TvseriesData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<TvseriesData>> getOnTheAirTvseries() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getOnTheAirTvseriesResponse();
      return List<TvseriesData>.from(
          response['results'].map((films) => TvseriesData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  //getting tvseries details
  static Future<TvseriesDetailsData?> getTvseriesDetails(int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getTvseriesDetailsResponse(movieId);
      return TvseriesDetailsData.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  static Future<List<ActorData>> getPopularActors() async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getPopularActorsResponse();
      return List<ActorData>.from(
          response['results'].map((films) => ActorData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<CastInMovieDetailsData>> getMovieCast(int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getMovieCastResponse(movieId);
      return List<CastInMovieDetailsData>.from(response['cast']
          .map((films) => CastInMovieDetailsData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<CrewInMovieDetailsData>> getMovieCrew(int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getMovieCrewResponse(movieId);
      return List<CrewInMovieDetailsData>.from(response['crew']
          .map((films) => CrewInMovieDetailsData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<CastInMovieDetailsData>> getTvseriesCast(
      int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getTvseriesCastResponse(movieId);
      return List<CastInMovieDetailsData>.from(response['cast']
          .map((films) => CastInMovieDetailsData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<List<CrewInMovieDetailsData>> getTvseriesCrew(
      int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getTvseriesCrewResponse(movieId);
      return List<CrewInMovieDetailsData>.from(response['crew']
          .map((films) => CrewInMovieDetailsData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  static Future<ActorDetailsData?> getActorDetails(int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getActorDetailsResponse(movieId);
      return ActorDetailsData.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  static Future<List<ActorCreditsData>> getActorCredits(int movieId) async {
    try {
      Map<String, dynamic> response =
          await NetworkService.getActorCreditsResponse(movieId);
      return List<ActorCreditsData>.from(
          response['cast'].map((films) => ActorCreditsData.fromJson(films)));
    } catch (e) {
      return [];
    }
  }

  // search
  static Future<List> getMovieOrTvseriesData(String query) async {
    List searchData = [];
    try {
      Map<String, dynamic> response = await NetworkService.multiSearch(query);
      searchData.addAll(List<FilmData>.from(
              response['results'].map((films) => FilmData.fromJson(films)))
          .where((element) => element.poster != null && element.name != null));
      searchData.addAll(List<TvseriesData>.from(
              response['results'].map((films) => TvseriesData.fromJson(films)))
          .where((element) => element.poster != null && element.name != null));
      searchData.addAll(List<ActorData>.from(
              response['results'].map((films) => ActorData.fromJson(films)))
          .where((element) => element.poster != null && element.name != null));
      return searchData;
    } catch (e) {
      return [];
    }
  }
}
