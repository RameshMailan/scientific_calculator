import "package:expressions/expressions.dart";

class CalculatorLogic {
  String evaluate(String expression) {
    try {
      final expr = Expression.parse(expression);
      const evaluate = ExpressionEvaluator();
      final result = evaluate.eval(expr, {});
      return result is double
          ? result.toStringAsPrecision(4) //Limit to 4 decimal
          : result.toString();
    } catch (e) {
      return "Error";
    }
  }

  String formatDisplay(String text, String input) {
    if (text == "0") {
      return input;
    } else if (input == "." && text.contains(".")) {
      return text; //Prevent adding multiple decimal
    } else if (input == "+" || input == "-" || input == "*" || input == "/") {
      if (text.endsWith("+") ||
          text.endsWith("-") ||
          text.endsWith("*") ||
          text.endsWith("/")) {
        return text; //Prevent entering multiple operators in a row
      }
    }
    return text + input;
  }

  String clear() {
    return "0";
  }

  String delete(String text) {
    if (text.length > 1) {
      return text.substring(0, text.length - 1);
    } else {
      return "0";
    }
  }
}
