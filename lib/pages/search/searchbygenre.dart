import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/search/searchbygenreresult.dart';
import '../../style/style.dart';
import '../../widgets/crewandcast.dart';

class SearchByGenre extends StatefulWidget {
  const SearchByGenre({Key? key}) : super(key: key);

  @override
  State<SearchByGenre> createState() => _SearchByGenreState();
}

class _SearchByGenreState extends State<SearchByGenre> {
  final _controller = FixedExtentScrollController();
  int currentState = 28;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Stack(
          children: [
            Positioned(
              child: Center(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width / 1.1,
                ),
              ),
            ),
            ListWheelScrollView.useDelegate(
              physics: const FixedExtentScrollPhysics(),
              controller: _controller,
              perspective: 0.002,
              diameterRatio: 1.5,
              itemExtent: 60,
              squeeze: 1.0,
              useMagnifier: true,
              magnification: 1.3,
              onSelectedItemChanged: (index) {
                setState(
                  () {
                    currentState = Genres.listOfGenres.keys.elementAt(index);
                  },
                );
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: Genres.listOfGenres.length,
                builder: (context, index) {
                  return Center(
                    child: Text(
                      Genres.listOfGenres.values.elementAt(index).tr,
                      style: AppStyle.normalBoldText,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      heroTag: 'btn1',
                      backgroundColor: AppStyle.whiteColor,
                      child: const Icon(
                        Icons.clear,
                        size: 30,
                      ),
                      onPressed: () {
                        if (mounted) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      heroTag: 'btn2',
                      backgroundColor: AppStyle.whiteColor,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchByGenreResult(
                            id: currentState.toString(),
                            genre: Genres.listOfGenres[currentState].toString(),
                          ),
                        ));
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
