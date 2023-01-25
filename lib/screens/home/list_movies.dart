import 'package:flutter/material.dart';

import '../detail_screen.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({Key? key, required this.deviceSize}) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 200,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: 10,
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (ctx, animation, animation1) {
                  return FadeTransition(
                    opacity: animation,
                    child: const DetailScreen(),
                  );
                },
              ),
            );
          },
          child: Container(
            width: deviceSize.width * 0.20,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20.0),
              // image: DecorationImage(
              //     image: ,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Jurassic World',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                Text('Isaias', maxLines: 1),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
