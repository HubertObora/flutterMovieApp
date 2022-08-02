import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/tvseries/tvseries_details_data.dart';
import 'package:movieapp/services/tmdb_network_service/network_service.dart';
import 'package:movieapp/style/style.dart';
import 'package:get/get.dart';
import 'package:movieapp/widgets/crewandcast.dart';

import '../../models/actors/cast_inmoviedetails_data.dart';
import '../../models/actors/crew_inmoviedetails_data.dart';
import '../../services/tmdb_repository_service/repository_serive.dart';
import '../../widgets/circleshadowicon.dart';
import '../../widgets/divider.dart';

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
  late TvseriesDetailsData? details;
  late List<CastInMovieDetailsData> cast;
  late List<CrewInMovieDetailsData> crew;

  Future loadMovieDetails() async {
    details = await RepositoryService.getTvseriesDetails(widget.id);
    cast = await RepositoryService.getTvseriesCast(widget.id);
    crew = await RepositoryService.getTvseriesCrew(widget.id);
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
            if (snapshot.connectionState == ConnectionState.done &&
                details != null) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        details?.backdropPath != null
                            ? CachedNetworkImage(
                                imageUrl: NetworkService.urlToPhoto +
                                    details!.backdropPath!,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error))
                            : const Image(
                                image: AssetImage('assets/no_image.png'),
                              ),
                        const IconShadow()
                      ],
                    ),
                    Text(
                      details!.name,
                      style: AppStyle.mainText,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'tvseries'.tr,
                      style: AppStyle.smallText,
                    ),
                    const DividerThic2(),
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
                            details!.voteAverage.toStringAsFixed(1),
                            style: AppStyle.normalText,
                          ),
                        ),
                      ],
                    ),
                    const DividerThic2(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height / 4,
                            width: size.width / 3,
                            child: details?.posterPath != null
                                ? CachedNetworkImage(
                                    imageUrl: NetworkService.urlToPhoto +
                                        details!.posterPath!,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Image(
                                          image:
                                              AssetImage('assets/no_image.png'),
                                        ))
                                : const Image(
                                    image: AssetImage('assets/no_image.png'),
                                  ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (details!.genres.isNotEmpty &&
                                    Genres.listOfGenres[
                                            details!.genres[0].id] !=
                                        null) ...[
                                  Text(
                                    'genre'.tr,
                                    style: AppStyle.normalText,
                                  ),
                                  Text(
                                    Genres.listOfGenres[details!.genres[0].id]
                                        .toString()
                                        .tr,
                                    style: AppStyle.normalBoldText,
                                  ),
                                ],
                                const SizedBox(
                                  height: 8,
                                ),
                                if (details!.seasons.isNotEmpty) ...[
                                  Text(
                                    'release_date'.tr,
                                    style: AppStyle.normalText,
                                  ),
                                  Text(
                                    details!.seasons[0].airDate.toString(),
                                    style: AppStyle.normalBoldText,
                                  ),
                                ],
                                const SizedBox(
                                  height: 8,
                                ),
                                if (details!
                                    .productionCountries.isNotEmpty) ...[
                                  Text(
                                    'production_country'.tr,
                                    style: AppStyle.normalText,
                                  ),
                                  Text(
                                    details!.productionCountries[0].name
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
                    if (details!.overview.isNotEmpty) ...[
                      const DividerThic2(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          details!.overview.toString(),
                          style: AppStyle.smallText,
                        ),
                      ),
                    ],
                    if (cast.isNotEmpty) ...[
                      const DividerThic2(),
                      Text(
                        'cast'.tr,
                        style: AppStyle.normalBoldText,
                      ),
                      SizedBox(
                        height: size.height * 0.3,
                        child: Cast(listOfActors: cast),
                      ),
                    ],
                    if (crew.isNotEmpty) ...[
                      const DividerThic2(),
                      Text(
                        'crew'.tr,
                        style: AppStyle.normalBoldText,
                      ),
                      SizedBox(
                        height: size.height * 0.3,
                        child: Crew(listOfActors: crew),
                      ),
                    ],
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
