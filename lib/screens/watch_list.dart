import 'package:flutter/material.dart';
import 'package:movie_app/screens/detail_screen/icon_text_row.dart';
import 'package:movie_app/utils/constants.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch list'),
      ),
      body: Padding(
        padding: kPadding20,
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                  child: Icon(Icons.ac_unit_outlined, size: 100),
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Spiderman',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      IconTextRow(
                        iconData: Icons.star_border,
                        label: '9.5',
                        color: Colors.amber,
                      ),
                      IconTextRow(
                        iconData: Icons.category,
                        label: 'Action',
                      ),
                      IconTextRow(
                        iconData: Icons.calendar_today,
                        label: '2019',
                      ),
                      IconTextRow(
                        iconData: Icons.access_time,
                        label: '139 minutes',
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(height: 20.0);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
