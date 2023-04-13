import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  static const operationColor = Colors.orange;

  final String text;
  final Color color;
  final TextAlign? alignment;
  final void Function(String) bottonPressed;

  const ButtonView({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(255, 46, 45, 45),
    required this.bottonPressed,
    this.alignment,
  });

  const ButtonView.operation({
    super.key,
    required this.text,
    this.color = operationColor,
    required this.bottonPressed,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => bottonPressed(text),
          ),
        ),
      ),
    );
  }
}
