import "package:expressions/expressions.dart";
import "dart:math" as math;

class CalculatorLogic {
  String evaluate(String expression) {
    try {
      //Replace π and exp(x) with corresponding values and functions
      expression = _replaceScientificOperations(expression);

      //Parse the expression and evaluate it
      final expr = Expression.parse(expression);
      const evaluate = ExpressionEvaluator();
      final result = evaluate.eval(expr, {});

      //Format result for cleaner display(limit precision for floating-point numbers)
      return result is double
          ? result.toStringAsPrecision(4) //Limit to 4 decimal
          : result.toString();
    } catch (e) {
      return "Error";
    }
  }

  //Format the display string by adding new input
  String formatDisplay(String text, String input) {
    if (text == "0") {
      return input;
    }

    if (input == "." && text.contains(".")) {
      return text; //Prevent adding multiple decimal
    }

    if (_isOperator(input) && _isOperator(text[text.length - 1])) {
      return text; //return the text unchanged
    }

    //Otherwise, ppend the new input to the current display
    return text + input;
  }

  String clear() {
    return "0";
  }

  //Delete the last character from the display
  String delete(String text) {
    if (text.length > 1) {
      return text.substring(0, text.length - 1);
    } else {
      return "0"; // If only one character is left, reset to "0"
    }
  }

  // Replace scientific operations like π, exp(x), x^y with actual values
  String _replaceScientificOperations(String expression) {
    expression = expression.replaceAll("π", math.pi.toString());
    //  expression = expression.replaceAll("exp(x)", "exp");
    expression = expression.replaceAll("x^y", "^");
    return expression;
  }

  bool _isOperator(String input) {
    return input == "+" ||
        input == "-" ||
        input == "*" ||
        input == "/" ||
        input == "^";
  }

  //Function to handle scientific operations like factorial, square root, etc.
  String handleScientificFunctions(String expression) {
    try {
      if (expression.contains("√")) {
        final expr = Expression.parse(expression);
        const evaluator = ExpressionEvaluator();
        final result = evaluator.eval(expr, {});
        return result;
      } else if (expression.contains("!")) {
        final number = double.parse(expression.replaceAll("!", ""));
        return _factorial(number).toString();
      } else if (expression.contains("exp")) {
        final number = double.parse(expression.replaceAll("exp", ""));
        return math.exp(number).toString();
      }
      return expression; // Return as is if no special functions
    } catch (e) {
      return "Error";
    }
  }

  // Calculate factorial
  double _factorial(double n) {
    if (n == 0 || n == 1) {
      return 1;
    }
    return n * _factorial(n - 1);
  }
}
