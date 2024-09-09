import "package:expressions/expressions.dart";

class CalculatorLogic {
  String evaluate(String expression) {
    try {
      final expr = Expression.parse(expression);
      const evaluate = ExpressionEvaluator();
      final result = evaluate.eval(expr, {});
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  String formatDisplay(String text, String input) {
    if (text == "0") {
      return input;
    } else {
      return text + input;
    }
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
