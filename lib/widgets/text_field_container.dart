import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 0.0,
    ),
    this.color,
    this.width,
    this.height,
  }) : super(key: key);
  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
