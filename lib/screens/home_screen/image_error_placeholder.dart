import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

class ImageErrorPlaceHolder extends StatelessWidget {
  const ImageErrorPlaceHolder({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error),
          kVerticalSpace10,
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          kVerticalSpace30,
        ],
      ),
    );
  }
}
