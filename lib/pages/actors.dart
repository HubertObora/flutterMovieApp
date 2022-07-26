// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/actors/actor_data.dart';
import 'package:movieapp/pages/actordetails.dart';
import 'package:movieapp/services/network_services/network_service.dart';
import 'package:movieapp/style.dart';
import 'package:get/get.dart';

class Actors extends StatefulWidget {
  const Actors({Key? key}) : super(key: key);

  @override
  State<Actors> createState() => _ActorsState();
}

class _ActorsState extends State<Actors> {
  @override
  void initState() {
    loadActors();
    super.initState();
  }

  List<ActorData> listOfPopularActors = [];
  Future loadActors() async {
    listOfPopularActors = await NetworkService().getPopularActors();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'popular_actors'.tr,
                style: AppStyle.mainText,
              ),
            ),
            SizedBox(
              height: size.height * 0.7,
              child: Expanded(
                child: PopularActors(listOfActors: listOfPopularActors),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class PopularActors extends StatelessWidget {
  const PopularActors({Key? key, required this.listOfActors}) : super(key: key);
  final List<ActorData> listOfActors;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: itemWidth / itemHeight),
        itemCount: listOfActors.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (() {
                    int actorId = listOfActors[index].id;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActorDetails(id: actorId)),
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(),
                    height: itemHeight - (itemHeight * 0.25),
                    width: itemWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: AppStyle.secondColor, width: 4)),
                    //tu błąd podczas ładowania zdjęć
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: NetworkService.urlToPhoto +
                          listOfActors[index].profile_path!,
                      placeholder: (context, url) => Center(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  listOfActors[index].name,
                  textAlign: TextAlign.center,
                  style: AppStyle.normalText,
                )
              ],
            ),
          );
        });
  }
}
