import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() ontap;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final Color color;
  final Color? colortext;

  const CustomButton({
    Key? key,
    required this.text,
    required this.ontap,
    required this.width,
    required this.height,
    this.margin,
    this.border,
    required this.color,
    required this.colortext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: colortext,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
