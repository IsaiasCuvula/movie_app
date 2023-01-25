import 'package:flutter/material.dart';
import 'package:movie_app/utils/movie_app_theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //TODO - Background image
          Container(
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
                      const Expanded(
                        flex: 3,
                        child: Text(
                          'Jurassic World',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          '2022',
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
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget lobortis diam.'
                    ' Nam aliquet ornare justo, in hendrerit libero gravida in. '
                    'Sed egestas, turpis ac tincidunt fringilla, turpis metus laoreet sapien, sed condimentum nibh lorem quis dui.'
                    ' Maecenas suscipit consectetur lorem in accumsan. Donec tempor molestie ligula at ornare. Nulla facilisi.'
                    ' Praesent non magna eu nunc placerat dictum efficitur efficitur eros. '
                    'Curabitur sit amet nunc lobortis, dignissim nisi eu, gravida sapien.'
                    ' Morbi a ultrices quam. Sed non risus vel urna tincidunt finibus.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18.0),
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
