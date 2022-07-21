import 'package:flutter/material.dart';
import 'package:movieapp/style.dart';
import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../keys/keys.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {
  final int id;
  final bool isFilm;

  const MovieDetails({
    super.key,
    required this.id,
    required this.isFilm,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  Map filmDetails = {};
  String title = '';
  String release_date = '';

  Future loadMovieDetails() async {
    TMDB tmdb = TMDB(ApiKeys(apikey, accesKey),
        defaultLanguage: Get.locale!.toLanguageTag(),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    if (widget.isFilm) {
      filmDetails = await tmdb.v3.movies.getDetails(widget.id);
      title = filmDetails['original_title'];
      release_date = filmDetails['release_date'].toString();
    } else {
      filmDetails = await tmdb.v3.tv.getDetails(widget.id);
      title = filmDetails['original_name'];
      release_date = filmDetails['seasons'][0]['air_date'].toString();
    }
  }

  @override
  void initState() {
    loadMovieDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      body: FutureBuilder(
        future: loadMovieDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: size.height / 3.5,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${filmDetails['backdrop_path']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    title,
                    style: AppStyle.mainText,
                    textAlign: TextAlign.center,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            height: size.height / 4,
                            width: size.width / 3,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${filmDetails['poster_path']}',
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'genre'.tr,
                              style: AppStyle.normalText,
                            ),
                            Text(filmDetails['genres'][0]['name'].toString()),
                            const Text(''),
                            Text(
                              'release_date'.tr,
                              style: AppStyle.normalText,
                            ),
                            Text(
                              release_date,
                              style: AppStyle.normalText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      filmDetails['overview'].toString(),
                      style: AppStyle.smallText,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class Genres {
  static Map<int, String> listOfGenres = {
    28: 'action',
    12: 'adventure',
    16: 'animation',
    35: 'comedy',
    80: 'crime',
    99: 'documentary',
    18: 'drama',
    10751: 'family',
    14: 'fantasy',
    36: 'history',
    10402: 'music',
    9648: 'mystery',
    10749: 'romance',
    878: 'science_fiction',
    10770: 'tv_movie',
    53: 'thriller',
    10752: 'war',
    37: 'western'
  };
}
