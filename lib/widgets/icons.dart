import 'package:flutter/material.dart';
import 'package:movieapp/pages/homepage/homepage.dart';

class IconShadow extends StatelessWidget {
  const IconShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: .5,
                      ),
                    ]),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: .5,
                      ),
                    ]),
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
      ],
    );
  }
}

class IconWatched extends StatelessWidget {
  const IconWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Icon(
        Icons.remove_red_eye_outlined,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}

class IconFavorite extends StatelessWidget {
  const IconFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Icon(
        Icons.favorite_outline,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
