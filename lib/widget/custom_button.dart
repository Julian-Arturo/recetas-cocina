import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() ontap;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;

  const CustomButton({
    Key? key,
    required this.text,
    required this.ontap,
    required this.width,
    required this.height,
    this.margin,
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
          color: const Color(0xffFA4A0C),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
