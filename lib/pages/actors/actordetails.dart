import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/models/actors/actor_credits_data.dart';
import 'package:movieapp/models/actors/actor_details_data.dart';
import 'package:movieapp/pages/movies/moviedetails.dart';
import 'package:movieapp/services/tmdb_network_service/network_service.dart';
import 'package:movieapp/widgets/divider.dart';

import '../../services/tmdb_repository_service/repository_serive.dart';
import '../../style/style.dart';

class ActorDetails extends StatefulWidget {
  final int id;

  const ActorDetails({
    super.key,
    required this.id,
  });

  @override
  State<ActorDetails> createState() => _ActorDetailsState();
}

class _ActorDetailsState extends State<ActorDetails> {
  late ActorDetailsData? details;
  late List<ActorCreditsData> actorCredits;

  Future loadActorDetails() async {
    details = await RepositoryService.getActorDetails(widget.id);
    actorCredits = await RepositoryService.getActorCredits(widget.id);
  }

  @override
  void initState() {
    loadActorDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      body: SafeArea(
        child: FutureBuilder(
          future: loadActorDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                details != null) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width / 1.5,
                      height: size.height / 2.5,
                      child: details!.profilePath != null
                          ? Image.network(
                              NetworkService.urlToPhoto + details!.profilePath!,
                              fit: BoxFit.cover,
                              height: size.height * 0.2,
                            )
                          : const Image(
                              image: AssetImage('assets/no_image.png'),
                            ),
                    ),
                    Text(
                      details!.name,
                      style: AppStyle.mainText,
                      textAlign: TextAlign.center,
                    ),
                    const DividerThic2(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.yellow,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            details!.popularity.toStringAsFixed(1),
                            style: AppStyle.normalText,
                          ),
                        ),
                      ],
                    ),
                    if (details!.birthday != null) ...[
                      const DividerThic2(),
                      Text(
                        'date_of_birth'.tr,
                        style: AppStyle.normalText,
                      ),
                      Text(
                        details!.birthday!,
                        style: AppStyle.normalBoldText,
                      ),
                      const DividerThic2(),
                    ],
                    if (details!.placeOfBirth != null) ...[
                      Text(
                        'place_of_birth'.tr,
                        style: AppStyle.normalText,
                      ),
                      Text(
                        details!.placeOfBirth!,
                        style: AppStyle.normalBoldText,
                      ),
                      const DividerThic2(),
                    ],
                    if (details!.biography.isNotEmpty) ...[
                      Text(
                        'biography'.tr,
                        style: AppStyle.normalText,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          details!.biography,
                          style: AppStyle.smallText,
                        ),
                      ),
                      const DividerThic2(),
                      Text(
                        'known_for'.tr,
                        style: AppStyle.normalText,
                      ),
                      SizedBox(
                        height: size.height * 0.35,
                        child: Credits(listOfActors: actorCredits),
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

class Credits extends StatelessWidget {
  const Credits({Key? key, required this.listOfActors}) : super(key: key);
  final List<ActorCreditsData> listOfActors;
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
                      builder: (context) => MovieDetails(
                        id: listOfActors[index].id,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      listOfActors[index].posterPath != null
                          ? CachedNetworkImage(
                              imageUrl: NetworkService.urlToPhoto +
                                  listOfActors[index].posterPath!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: size.width / 3,
                                height: size.height / 4,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppStyle.secondColor, width: 4),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain),
                                ),
                              ),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : Image(
                              width: size.width / 3,
                              height: size.height / 4,
                              image: const AssetImage('assets/no_image.png')),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: listOfActors[index].title != null
                            ? Text(
                                listOfActors[index].title!.length > 12
                                    ? '${listOfActors[index].title!.substring(0, 11)}...'
                                    : listOfActors[index].title!,
                                style: AppStyle.normalText,
                              )
                            : Text(
                                listOfActors[index].name!.length > 12
                                    ? '${listOfActors[index].name!.substring(0, 11)}...'
                                    : listOfActors[index].name!,
                                style: AppStyle.normalText,
                              ),
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
