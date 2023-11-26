import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculadora/memory.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  final _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            _buildDisplay(),
            _buildKeyboard(),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AutoSizeText(
              _memory.result,
              minFontSize: 40.0,
              maxFontSize: 80.0,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.none,
                fontSize: 80.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyboardButton(
    String label, {
    int flex = 1,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(0.7),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(
              RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.zero,
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            textStyle: MaterialStatePropertyAll(TextStyle(color: textColor)),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          onPressed: () {
            setState(() {
              _memory.applyCommand(label);
            });
          },
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return SizedBox(
      height: 300.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('AC', backgroundColor: Colors.white24),
                _buildKeyboardButton('+/-', backgroundColor: Colors.white24),
                _buildKeyboardButton('%', backgroundColor: Colors.white24),
                _buildKeyboardButton('÷', backgroundColor: Colors.orange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7', backgroundColor: Colors.white38),
                _buildKeyboardButton('8', backgroundColor: Colors.white38),
                _buildKeyboardButton('9', backgroundColor: Colors.white38),
                _buildKeyboardButton('x', backgroundColor: Colors.orange)
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4', backgroundColor: Colors.white38),
                _buildKeyboardButton('5', backgroundColor: Colors.white38),
                _buildKeyboardButton('6', backgroundColor: Colors.white38),
                _buildKeyboardButton('-', backgroundColor: Colors.orange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1', backgroundColor: Colors.white38),
                _buildKeyboardButton('2', backgroundColor: Colors.white38),
                _buildKeyboardButton('3', backgroundColor: Colors.white38),
                _buildKeyboardButton('+', backgroundColor: Colors.orange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0',
                    backgroundColor: Colors.white38, flex: 2),
                _buildKeyboardButton(',', backgroundColor: Colors.white38),
                _buildKeyboardButton('=', backgroundColor: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
