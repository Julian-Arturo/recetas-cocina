import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final double width;
  final String src;
  final EdgeInsetsGeometry? margin;
  const CustomLogo({
    Key? key,
    required this.width,
    required this.src,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      child: Image(
        image: AssetImage(src),
      ),
    );
  }
}
