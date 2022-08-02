import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/movies/film_data.dart';
import '../../models/tvseries/tvseries_data.dart';
import '../../services/tmdb_network_service/network_service.dart';
import '../../services/tmdb_repository_service/repository_serive.dart';
import '../../style/style.dart';
import '../movies/moviedetails.dart';
import '../tvseries/tvseriesdetails.dart';

// ignore: must_be_immutable
class SearchByGenreResult extends StatelessWidget {
  final String id;
  final String genre;
  SearchByGenreResult({Key? key, required this.id, required this.genre})
      : super(key: key);
  List searchData = [];
  Future loadSearchResults(String query) async {
    searchData = await RepositoryService.getGenreSearchResult(id);
    return searchData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.secondColor,
        title: Text(genre.tr),
      ),
      body: FutureBuilder(
          future: loadSearchResults(id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GenreResult(listOfResults: searchData);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class GenreResult extends StatelessWidget {
  const GenreResult({Key? key, required this.listOfResults}) : super(key: key);
  final List listOfResults;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2.5;
    final double itemWidth = size.width / 2;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: itemWidth / itemHeight),
      itemCount: listOfResults.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                onTap: (() {
                  int elementId = listOfResults[index].id;
                  if (listOfResults[index].runtimeType == FilmData) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetails(id: elementId)),
                    );
                  } else if (listOfResults[index].runtimeType == TvseriesData) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TvseriesDetails(id: elementId)),
                    );
                  }
                }),
                child: Container(
                  height: itemHeight - (itemHeight * 0.30),
                  width: itemWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: AppStyle.secondColor, width: 4)),
                  child: listOfResults[index].poster != null
                      ? CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: NetworkService.urlToPhoto +
                              listOfResults[index].poster!,
                          placeholder: (context, url) => const Center(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : const Image(
                          image: AssetImage('assets/no_image.png'),
                        ),
                ),
              ),
              listOfResults[index].name != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        listOfResults[index].name.length > 26
                            ? '${listOfResults[index].name.substring(0, 25)}...'
                            : '${listOfResults[index].name}',
                        textAlign: TextAlign.center,
                        style: AppStyle.normalText,
                        maxLines: 2,
                      ),
                    )
                  : Text(
                      'no_info'.tr,
                      style: AppStyle.normalText,
                    )
            ],
          ),
        );
      },
    );
  }
}
