import "package:flutter/material.dart";

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = "0";
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _buttonPressed(String text) {
    setState(() {
      if (text == "C") {
        _display = "0";
      } else if (text == "=") {
        try {
          _display = _evaluateExpression(_display).toString();
        } catch (e) {
          _display = "Error";
        }
      } else {
        if (_display == "0") {
          _display = text;
        } else {
          _display += text;
        }
      }
    });
  }

  double _evaluateExpression(String expression) {
    // Simple evaluation; consider using a package for more complex expression
    return double.parse(expression);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scientific Calculator"),
        backgroundColor: Colors.orange.shade600,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  _display,
                  style: const TextStyle(fontSize: 48),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 5000),
              curve: Curves.easeInOut,
              height: _isExpanded ? 120 : 0, //Adjust height based on your needs
              child: _isExpanded
                  ? Column(
                      children: [
                        Row(
                          children: [
                            _buildButton("sin"),
                            _buildButton("cos"),
                            _buildButton("tan"),
                            _buildButton("sqrt"),
                          ],
                        ),
                        Row(
                          children: [
                            _buildButton("log"),
                            _buildButton("ln"),
                            _buildButton("exp"),
                            _buildButton("pi"),
                          ],
                        ),
                      ],
                    )
                  : null,
            ),
          ),
          Expanded(
            flex: 3,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextButton(
                          onPressed: _toggleExpanded,
                          child: Text(
                            _isExpanded ? "sci" : "sci",
                            style: const TextStyle(fontSize: 22.0),
                          ),
                        ),
                      ),
                    ),
                    _buildButton("0"),
                    _buildButton("."),
                    _buildButton("="),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void _buttonPressed(String text) {
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
