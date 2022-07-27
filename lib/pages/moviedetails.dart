import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movies/film_details_data.dart';
import 'package:movieapp/pages/actordetails.dart';
import 'package:movieapp/services/network_service.dart';
import 'package:movieapp/style.dart';
import 'package:get/get.dart';

import '../models/actors/actor_data.dart';

class MovieDetails extends StatefulWidget {
  final int id;

  const MovieDetails({
    super.key,
    required this.id,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late FilmDetailsData details;
  late List<ActorData> crew;

  Future loadMovieDetails() async {
    details = await NetworkService.getMovieDetails(widget.id);
    crew = await NetworkService.getMovieCrew(widget.id);
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
                    details.backdrop_path != null
                        ? SizedBox(
                            width: double.infinity,
                            height: size.height / 3.5,
                            child: Image.network(
                              NetworkService.urlToPhoto +
                                  details.backdrop_path!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.network(NetworkService.photoNotFoundUrl),
                    Text(
                      details.title,
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
                                : Image.network(
                                    NetworkService.photoNotFoundUrl),
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
                                Text(
                                  'release_date'.tr,
                                  style: AppStyle.normalText,
                                ),
                                Text(
                                  details.release_date,
                                  style: AppStyle.normalBoldText,
                                ),
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
                    Text(
                      'crew'.tr,
                      style: AppStyle.normalBoldText,
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                      child: Crew(listOfActors: crew),
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

class Crew extends StatelessWidget {
  const Crew({Key? key, required this.listOfActors}) : super(key: key);
  final List<ActorData> listOfActors;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: listOfActors.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActorDetails(
                        id: listOfActors[index].id,
                      ),
                    ),
                  );
                },
                //pracuje nad tym teraz
                child: listOfActors[index].profile_path != null
                    ? Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                NetworkService.urlToPhoto +
                                    listOfActors[index].profile_path!),
                          ),
                        ),
                      ) //CachedNetworkImage(
                    //     imageUrl: NetworkService.urlToPhoto +
                    //         listOfActors[index].profile_path!,
                    //     imageBuilder: (context, imageProvider) => Container(
                    //       width: size.width / 3,
                    //       height: size.height / 3,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //             color: AppStyle.secondColor, width: 4),
                    //         image: DecorationImage(
                    //             image: imageProvider, fit: BoxFit.contain),
                    //       ),
                    //     ),
                    //     placeholder: (context, url) =>
                    //         const Center(child: CircularProgressIndicator()),
                    //     errorWidget: (context, url, error) =>
                    //         const Icon(Icons.error),
                    //   )
                    : Center(
                        child: CircleAvatar(
                          radius: size.height / 13,
                          backgroundImage:
                              const AssetImage('assets/no_image.png'),
                        ),
                      ),
              ),
            ),
          ],
        );
      },
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
