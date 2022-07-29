// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/tvseries/tvseries_data.dart';
import 'package:movieapp/pages/tvseries/tvseriesdetails.dart';
import 'package:movieapp/services/tmdb_repository_service/repository_serive.dart';
import 'package:movieapp/style/style.dart';
import 'package:get/get.dart';
import '../../services/tmdb_network_service/network_service.dart';

class TvSeries extends StatefulWidget {
  const TvSeries({Key? key}) : super(key: key);

  @override
  State<TvSeries> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  @override
  void initState() {
    loadTvSeries();
    super.initState();
  }

  List<TvseriesData> topRatedTvseries = [],
      popularTvseries = [],
      airingTvseries = [],
      onTheAirTvseries = [];

  Future loadTvSeries() async {
    topRatedTvseries = await RepositoryService.getTopRatedTvseries();
    popularTvseries = await RepositoryService.getPopularTvseries();
    airingTvseries = await RepositoryService.getAiringTvseries();
    onTheAirTvseries = await RepositoryService.getOnTheAirTvseries();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieText(text: 'popular_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
                child: TrendingTvSeries(listOfTvSeries: topRatedTvseries),
              ),
              MovieText(text: 'top_rated_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
                child: TrendingTvSeries(listOfTvSeries: popularTvseries),
              ),
              MovieText(text: 'airing_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
                child: TrendingTvSeries(listOfTvSeries: airingTvseries),
              ),
              MovieText(text: 'ontheair_tvseries'.tr),
              SizedBox(
                height: size.height * 0.15,
                child: TrendingTvSeries(listOfTvSeries: onTheAirTvseries),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingTvSeries extends StatelessWidget {
  const TrendingTvSeries({Key? key, required this.listOfTvSeries})
      : super(key: key);
  final List<TvseriesData> listOfTvSeries;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: listOfTvSeries.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: GestureDetector(
            onTap: () {
              int filmId = listOfTvSeries[index].id;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TvseriesDetails(
                    id: filmId,
                  ),
                ),
              );
            },
            child: Container(
              height: size.height / 4.0,
              width: size.width / 1.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppStyle.secondColor, width: 4)),
              //tu błąd podczas ładowania zdjęć czasem wyrzuci
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: NetworkService.urlToPhoto +
                    listOfTvSeries[index].backdropPath!,
                placeholder: (context, url) => Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MovieText extends StatelessWidget {
  const MovieText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 0, 0),
        child: Text(
          text,
          style: AppStyle.mainText,
        ));
  }
}
