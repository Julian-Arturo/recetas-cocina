import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final IconData iconData;
  final Function() onPressed;

  const CustomSnackbar({
    Key? key,
    required this.message,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldMessenger(
      child: SizedBox.shrink(),
      // Utilizamos un SizedBox.shrink() para que no se muestre el ScaffoldMessenger en la interfaz
    );
  }

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Row(
          children: [
            Icon(
              iconData,
              color: Colors.green,
            ),
            const SizedBox(width: 8),
            Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'LOGIN',
          textColor: Colors.green,
          onPressed: onPressed,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
