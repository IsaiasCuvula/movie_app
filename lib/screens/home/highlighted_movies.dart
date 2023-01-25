import 'package:flutter/material.dart';

class HighlightedMovies extends StatelessWidget {
  const HighlightedMovies({Key? key, required this.deviceSize})
      : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceSize.height * 0.25,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            width: deviceSize.width * 0.42,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20.0),
              // image: DecorationImage(
              //     image: ,
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Jurassic World Jurassic',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
                Text('Isaias', maxLines: 1),
                SizedBox(height: 10.0),
              ],
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(width: 20.0);
        },
        itemCount: 3,
      ),
    );
  }
}
