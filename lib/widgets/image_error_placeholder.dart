import 'package:flutter/material.dart';

class ImageErrorPlaceHolder extends StatelessWidget {
  const ImageErrorPlaceHolder({
    Key? key,
    required this.width,
    required this.title,
    this.height,
  }) : super(key: key);

  final double width;
  final double? height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error),
          const SizedBox(height: 40.0),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
