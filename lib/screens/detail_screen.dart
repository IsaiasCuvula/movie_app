import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/utils/movie_app_theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //TODO - Background image
          Container(
            alignment: Alignment.topLeft,
            width: deviceSize.width,
            height: deviceSize.height * 0.50,
            decoration: BoxDecoration(
              //color: Colors.tealAccent,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  kDarkGrey,
                  Colors.red,
                ],
              ),
              //image: DecorationImage(image: image)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(
                    onPressed: () {
                      print('save in favorites');
                    },
                    icon: const Icon(Icons.bookmark_border_outlined),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          '${movie.title}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${movie.year}',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: const [
                            Text(
                              '⭐️⭐⭐⭐⭐',
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'From 342 users',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Marvel Studios',
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    '${movie.storyline}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
