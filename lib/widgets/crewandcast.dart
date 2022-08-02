import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/actors/cast_inmoviedetails_data.dart';
import '../models/actors/crew_inmoviedetails_data.dart';
import '../pages/Actors/actordetails.dart';
import '../services/tmdb_network_service/network_service.dart';
import '../style/style.dart';

class Cast extends StatelessWidget {
  const Cast({Key? key, required this.listOfActors}) : super(key: key);
  final List<CastInMovieDetailsData> listOfActors;
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      listOfActors[index].profilePath != null
                          ? CachedNetworkImage(
                              imageUrl: NetworkService.urlToPhoto +
                                  listOfActors[index].profilePath!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: size.width / 2.5,
                                height: size.height / 5.5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppStyle.secondColor, width: 4),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => SizedBox(
                                width: size.width / 2.5,
                                height: size.height / 5.5,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : Center(
                              child: CircleAvatar(
                                radius: size.height / 11,
                                backgroundImage:
                                    const AssetImage('assets/no_image.png'),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          listOfActors[index].name.length > 15
                              ? '${listOfActors[index].name.substring(0, 14)}... as'
                              : '${listOfActors[index].name} as',
                          style: AppStyle.smallText,
                        ),
                      ),
                      Text(
                        listOfActors[index].character.length > 17
                            ? '${listOfActors[index].character.substring(0, 17)}...'
                            : listOfActors[index].character,
                        style: AppStyle.smallText,
                      ),
                    ],
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

class Crew extends StatelessWidget {
  const Crew({Key? key, required this.listOfActors}) : super(key: key);
  final List<CrewInMovieDetailsData> listOfActors;
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      listOfActors[index].profilePath != null
                          ? CachedNetworkImage(
                              imageUrl: NetworkService.urlToPhoto +
                                  listOfActors[index].profilePath!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: size.width / 2.5,
                                height: size.height / 5.5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppStyle.secondColor, width: 4),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => SizedBox(
                                width: size.width / 2.5,
                                height: size.height / 5.5,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : Center(
                              child: CircleAvatar(
                                radius: size.height / 11,
                                backgroundImage:
                                    const AssetImage('assets/no_image.png'),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          listOfActors[index].name.length > 17
                              ? '${listOfActors[index].name.substring(0, 16)}...'
                              : '${listOfActors[index].name} as',
                          style: AppStyle.smallText,
                        ),
                      ),
                      Text(
                        listOfActors[index].department,
                        style: AppStyle.smallText,
                      ),
                    ],
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
