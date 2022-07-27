import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/models/actors/actor_details_data.dart';
import 'package:movieapp/services/network_service.dart';
import 'package:movieapp/style.dart';

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
  late ActorDetailsData details;

  Future loadActorDetails() async {
    details = await NetworkService.getActorDetails(widget.id);
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
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width / 1.5,
                      height: size.height / 2,
                      child: details.profile_path != null
                          ? Image.network(
                              NetworkService.urlToPhoto + details.profile_path!,
                              fit: BoxFit.cover,
                              height: size.height * 0.2,
                            )
                          : const Image(
                              image: AssetImage('assets/no_image.png'),
                            ),
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
                          Icons.people,
                          color: Colors.yellow,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            details.popularity.toStringAsFixed(1),
                            style: AppStyle.normalText,
                          ),
                        ),
                      ],
                    ),
                    if (details.birthday != null) ...[
                      const Divider(
                        thickness: 2,
                      ),
                      Text(
                        'date_of_birth'.tr,
                        style: AppStyle.normalText,
                      ),
                      Text(
                        details.birthday!,
                        style: AppStyle.normalBoldText,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                    ],
                    if (details.place_of_birth != null) ...[
                      Text(
                        'place_of_birth'.tr,
                        style: AppStyle.normalText,
                      ),
                      Text(
                        details.place_of_birth!,
                        style: AppStyle.normalBoldText,
                      ),
                    ],
                    const Divider(
                      thickness: 2,
                    ),
                    Text(
                      'biography'.tr,
                      style: AppStyle.normalText,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        details.biography,
                        style: AppStyle.smallText,
                      ),
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
