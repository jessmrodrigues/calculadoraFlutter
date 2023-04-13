import 'package:flutter/material.dart';
import 'button_view.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) bottonPressed;

  const Keyboard(this.bottonPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ButtonView(
              text: 'AC',
              color: const Color.fromARGB(255, 149, 149, 149),
              bottonPressed: bottonPressed,
            ),
            ButtonView(
              text: '%',
              color: const Color.fromARGB(255, 149, 149, 149),
              bottonPressed: bottonPressed,
            ),
            const SizedBox(height: 5, width: 3),
            ButtonView.operation(
              text: '/',
              bottonPressed: bottonPressed,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ButtonView(
              text: '7',
              bottonPressed: bottonPressed,
            ),
            ButtonView(
              text: '8',
              bottonPressed: bottonPressed,
            ),
            ButtonView(
              text: '9',
              bottonPressed: bottonPressed,
            ),
            ButtonView.operation(
              text: 'x',
              bottonPressed: bottonPressed,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ButtonView(
              text: '4',
              bottonPressed: bottonPressed,
            ),
            ButtonView(
              text: '5',
              bottonPressed: bottonPressed,
            ),
            ButtonView(
              text: '6',
              bottonPressed: bottonPressed,
            ),
            ButtonView.operation(
              text: '-',
              bottonPressed: bottonPressed,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ButtonView(
              text: '1',
              bottonPressed: bottonPressed,
            ),
            ButtonView(
              text: '2',
              bottonPressed: bottonPressed,
            ),
            ButtonView(
              text: '3',
              bottonPressed: bottonPressed,
            ),
            ButtonView.operation(
              text: '+',
              bottonPressed: bottonPressed,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ButtonView(
              text: '0',
              bottonPressed: bottonPressed,
              alignment: TextAlign.start,
            ),
            ButtonView(
              text: '.',
              bottonPressed: bottonPressed,
            ),
            ButtonView.operation(
              text: '=',
              bottonPressed: bottonPressed,
            ),
          ],
        ),
      ],
    ));
  }
}
