import 'package:flutter/material.dart';
import 'package:receta_cocina/controller/logic_controller.dart';

class LoginFormButton {
  final String text;
  final FormType formType;

  const LoginFormButton({required this.text, required this.formType});
}

class LoginFormButtonGroup extends StatelessWidget {
  final List<LoginFormButton> buttons;
  final FormType selectedFormType;
  final void Function(FormType formType) onTap;

  const LoginFormButtonGroup({
    Key? key,
    required this.buttons,
    required this.selectedFormType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons.map((button) {
        final isSelected = button.formType == selectedFormType;
        return InkWell(
          onTap: () => onTap(button.formType),
          child: Column(
            children: [
              Text(
                button.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              if (isSelected)
                Container(
                  height: 2,
                  width: 70,
                  color: const Color(0xffFA4A0C),
                )
            ],
          ),
        );
      }).toList(),
    );
  }
}
