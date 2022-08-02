import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../../keys/keys.dart';

class NetworkService {
  static TMDB tmdb = TMDB(ApiKeys(apikey, accesKey),
      defaultLanguage: Get.locale!.toLanguageTag(),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

  static String urlToPhoto = 'https://image.tmdb.org/t/p/w500';

  static String photoNotFoundUrl =
      'https://image.tmdb.org/t/p/w500/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg';

  // movies
  static Future<Map<String, dynamic>> getTrendingMoviesResponse() async {
    return await tmdb.v3.trending.getTrending(
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getPopularMoviesResponse() async {
    return await tmdb.v3.movies.getPopular(
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getTopRatedMoviesResponse() async {
    return await tmdb.v3.movies.getTopRated(
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getNowPlayingMoviesResponse() async {
    return await tmdb.v3.movies.getNowPlaying(
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getUpcomingMoviesResponse() async {
    return await tmdb.v3.movies.getUpcoming(
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  //movie details

  static Future<Map<String, dynamic>> getMovieDetailsResponse(
      int movieId) async {
    return await tmdb.v3.movies.getDetails(movieId,
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  //tv series

  static Future<Map<String, dynamic>> getTopRatedTvseriesResponse() async {
    return await tmdb.v3.tv.getTopRated(
        page: 2, language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getPopularTvseriesResponse() async {
    return await tmdb.v3.tv.getPopular(language: Get.locale!.toLanguageTag())
        as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getAiringTvseriesResponse() async {
    return await tmdb.v3.tv.getAiringToday(
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getOnTheAirTvseriesResponse() async {
    return await tmdb.v3.tv.getOnTheAir(language: Get.locale!.toLanguageTag())
        as Map<String, dynamic>;
  }

  //tvseries details

  static Future<Map<String, dynamic>> getTvseriesDetailsResponse(
      int movieId) async {
    return await tmdb.v3.tv.getDetails(movieId,
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  //actors

  static Future<Map<String, dynamic>> getPopularActorsResponse() async {
    return await tmdb.v3.people.getPopular(
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getMovieCastResponse(int movieId) async {
    return await tmdb.v3.movies.getCredits(movieId) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getMovieCrewResponse(int movieId) async {
    return await tmdb.v3.movies.getCredits(movieId) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getTvseriesCastResponse(
      int movieId) async {
    return await tmdb.v3.tv.getCredits(movieId) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getTvseriesCrewResponse(
      int movieId) async {
    return await tmdb.v3.tv.getCredits(movieId) as Map<String, dynamic>;
  }

//
  static Future<Map<String, dynamic>> getActorDetailsResponse(
      int actorId) async {
    return await tmdb.v3.people.getDetails(actorId,
        language: Get.locale!.toLanguageTag()) as Map<String, dynamic>;
  }

//
  static Future<Map<String, dynamic>> getActorCreditsResponse(
      int movieId) async {
    return await tmdb.v3.people.getCombinedCredits(movieId)
        as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> multiSearch(String query) async {
    Map<String, dynamic> response =
        await tmdb.v3.search.queryMulti(query) as Map<String, dynamic>;
    return response;
  }
}
