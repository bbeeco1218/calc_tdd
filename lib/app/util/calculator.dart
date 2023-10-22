enum Operator {
  addition('+', 1),
  subtraction('-', 1),
  multiplication('*', 2),
  division('/', 2),
  unknown('', -1);

  final String value;
  // 우선순위 (높은값이 먼저 계산됨)
  final int precedence;

  const Operator(this.value, this.precedence);

  bool get isOperator => this != unknown;

  factory Operator.getOperatorFromValue(String value) =>
      Operator.values.firstWhere((element) => element.value == value, orElse: () => unknown);
}

class Calculator {
  // 연산자 우선순위

  /// 계산식을 계산합니다. (null 이라면 수식이 잘못됨)
  double? calculate(String expression) {
    if (!isMathExpression(expression)) return null;

    // 후위표기식 변환
    final List<String> postfixedExpression = convertPostfix(expression);

    final operandStack = <double>[];

    // 변환된 후위표기식 계산
    for (final token in postfixedExpression) {
      final Operator operator = Operator.getOperatorFromValue(token);
      if (operator.isOperator) {
        final b = operandStack.removeLast();
        final a = operandStack.removeLast();
        final double? result = calcluatByOperator(a, b, operator);

        if (result == null) return null;

        operandStack.add(result);

        continue;
      }

      operandStack.add(double.parse(token));
    }

    return operandStack.single;
  }

  // 후위표기식 변환 메서드
  List<String> convertPostfix(String expression) {
    // 입력 수식 분할
    final List<String> tokens = expression.split(' ');

    final List<String> output = [];
    final List<String> stack = [];

    for (final String token in tokens) {
      final Operator operator = Operator.getOperatorFromValue(token);
      if (operator.isOperator) {
        // 새로운 연산자 일경우 스택에서 우선순위가 낮은 연산자를 결과리스트로 이동
        while (stack.isNotEmpty && operator.precedence <= Operator.getOperatorFromValue(stack.last).precedence) {
          output.add(stack.removeLast());
        }
        stack.add(token);
        continue;
      }

      output.add(token);
    }

    // 스택에 남아 있는 연산자를 결과로 이동
    while (stack.isNotEmpty) {
      output.add(stack.removeLast());
    }

    return output;
  }

  // 수식확인
  bool isMathExpression(String expression) {
    RegExp regex = RegExp(r'^[0-9]+(\.[0-9]+)?\s([+\-*/]\s[0-9]+(\.[0-9]+)?\s)*[+\-*/]\s[0-9]+(\.[0-9]+)?$');
    return regex.hasMatch(expression);
  }

  double addition(double a, double b) => a + b;
  double subtraction(double a, double b) => a - b;
  double multiplication(double a, double b) => a * b;
  double division(double a, double b) => a / b;

  // 연산자에 따른 계산로직 (연산자가 잘못됐을경우 null)
  double? calcluatByOperator(double a, double b, Operator operator) {
    switch (operator) {
      case Operator.addition:
        return addition(a, b);
      case Operator.subtraction:
        return subtraction(a, b);
      case Operator.multiplication:
        return multiplication(a, b);
      case Operator.division:
        return division(a, b);
      default:
        return null;
    }
  }
}
