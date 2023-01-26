import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({Key? key, required this.iconData, required this.label})
      : super(key: key);

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 18.0,
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
