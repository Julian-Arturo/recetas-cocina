import 'package:flutter/material.dart';

class Loading {
  static loadingCircle({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        });
  }
}
