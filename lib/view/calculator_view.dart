import 'package:flutter/material.dart';
import '../controller/calculator_logic_controller.dart';
import '../model/display_view.dart';
import '../model/keyboard_view.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final DisplayController memory = DisplayController();


_onPressed(String command) {
  setState(() {
    memory.handleCommand(command);
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Display(memory.value),
          Keyboard(_onPressed), 
        ],
      )
    );
  }
}