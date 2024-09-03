import "dart:js_interop_unsafe";

import "package:flutter/material.dart";

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scientific Calculator"),
        backgroundColor: Colors.orange.shade600,
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Row(
              children: [
                Text("Results"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton("AC"),
                    _buildButton("Del"),
                    _buildButton("%"),
                    _buildButton("/")
                  ],
                ),
                Row(
                  children: [
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("*")
                  ],
                ),
                Row(
                  children: [
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("-")
                  ],
                ),
                Row(
                  children: [
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("+")
                  ],
                ),
                Row(
                  children: [
                    _buildButton("Sci-Fi"),
                    _buildButton("0"),
                    _buildButton("."),
                    _buildButton("=")
                  ],
                ),
              ],
            ),
          ),
          //   ],
          // ),
        ],
      ),
    );
  }

  void _buttonPressed(String text) {
    print("Button pressed: $text");
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextButton(
          onPressed: () => _buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }
}
