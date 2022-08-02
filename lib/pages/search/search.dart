// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/actors/actor_data.dart';
import 'package:movieapp/models/movies/film_data.dart';
import 'package:movieapp/models/tvseries/tvseries_data.dart';
import 'package:movieapp/pages/actors/actordetails.dart';
import 'package:movieapp/pages/movies/moviedetails.dart';
import 'package:movieapp/pages/tvseries/tvseriesdetails.dart';
import 'package:movieapp/services/tmdb_network_service/network_service.dart';
import 'package:movieapp/services/tmdb_repository_service/repository_serive.dart';
import 'package:get/get.dart';
import '../../style/style.dart';

class CustomSearchDelegate extends SearchDelegate {
  List searchData = [];
  Future loadSearchResults(String query) async {
    searchData = await RepositoryService.multiSearch(query);
    return searchData;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            searchData = [];
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: loadSearchResults(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SearchResult(listOfResults: searchData);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center();
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.listOfResults}) : super(key: key);
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
                    } else if (listOfResults[index].runtimeType ==
                        TvseriesData) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TvseriesDetails(id: elementId)),
                      );
                    } else if (listOfResults[index].runtimeType == ActorData) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActorDetails(id: elementId)),
                      );
                    }
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(),
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
                            placeholder: (context, url) => Center(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
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
        });
  }
}
