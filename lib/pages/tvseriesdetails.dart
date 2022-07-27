import 'package:flutter/material.dart';
import 'package:movieapp/models/tvseries/tvseries_details_data.dart';
import 'package:movieapp/services/network_service.dart';
import 'package:movieapp/style.dart';
import 'package:get/get.dart';

class TvseriesDetails extends StatefulWidget {
  final int id;

  const TvseriesDetails({
    super.key,
    required this.id,
  });

  @override
  State<TvseriesDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<TvseriesDetails> {
  late TvseriesDetailsData details;

  Future loadMovieDetails() async {
    details = await NetworkService.getTvseriesDetails(widget.id);
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
      body: SafeArea(
        child: FutureBuilder(
          future: loadMovieDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height / 3.5,
                      child: details.backdrop_path != null
                          ? Image.network(
                              NetworkService.urlToPhoto +
                                  details.backdrop_path!,
                              fit: BoxFit.cover,
                            )
                          : const Image(
                              image: AssetImage('assets/no_image.png')),
                    ),
                    Text(
                      details.name,
                      style: AppStyle.mainText,
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            details.vote_average.toStringAsFixed(1),
                            style: AppStyle.normalText,
                          ),
                        ),
                      ],
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
                            child: details.poster_path != null
                                ? Image.network(
                                    NetworkService.urlToPhoto +
                                        details.poster_path!,
                                    fit: BoxFit.cover,
                                  )
                                : const Image(
                                    image: AssetImage('assets/no_image.png'),
                                  ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (details.genres.isNotEmpty) ...[
                                  Text(
                                    'genre'.tr,
                                    style: AppStyle.normalText,
                                  ),
                                  Text(
                                    Genres.listOfGenres[details.genres[0].id]
                                        .toString()
                                        .tr,
                                    style: AppStyle.normalBoldText,
                                  ),
                                ],
                                const SizedBox(
                                  height: 8,
                                ),
                                if (details.seasons.isNotEmpty) ...[
                                  Text(
                                    'release_date'.tr,
                                    style: AppStyle.normalText,
                                  ),
                                  Text(
                                    details.seasons[0].air_date.toString(),
                                    style: AppStyle.normalBoldText,
                                  ),
                                ],
                                const SizedBox(
                                  height: 8,
                                ),
                                if (details
                                    .production_countries.isNotEmpty) ...[
                                  Text(
                                    'production_country'.tr,
                                    style: AppStyle.normalText,
                                  ),
                                  Text(
                                    details.production_countries[0].name
                                        .toString(),
                                    style: AppStyle.normalBoldText,
                                  ),
                                ],
                              ],
                            ),
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
                        details.overview.toString(),
                        style: AppStyle.smallText,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
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
