import 'package:calc_test/app/util/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('calculator', () {
    Calculator calculator = Calculator();

    // 덧셈
    test('addition test a + b', () {
      expect(calculator.addition(20, 30), 50);
    });

    // 뺄셈
    test('subtraction test a - b', () {
      expect(calculator.subtraction(30, 20), 10);
    });

    // 곱셈
    test('multiplication test a * b', () {
      expect(calculator.multiplication(10, 10), 10 * 10);
    });

    // 나누기
    test('division test a / b', () {
      expect(calculator.division(10, 10), 10 / 10);
    });

    // 수식 유효성검사
    test('mathExpression test \'10 + 10 * 10\'', () {
      const String expression = '10 + 10 * 10';
      expect(calculator.isMathExpression(expression), true);

      const String expression2 = '10 * 10 - 10 =';
      expect(calculator.isMathExpression(expression2), false);

      const String expression3 = '10*10-10';
      expect(calculator.isMathExpression(expression3), false);
    });

    // 연산자에 따른 계산 a, b, [Operator]
    test('calcluatByOperator test (a, b, Operator) ', () {
      expect(calculator.calcluatByOperator(10, 10, Operator.addition), 20);

      expect(calculator.calcluatByOperator(10, 10, Operator.subtraction), 0);

      expect(calculator.calcluatByOperator(10, 10, Operator.multiplication), 100);

      expect(calculator.calcluatByOperator(10, 10, Operator.division), 1);

      expect(calculator.calcluatByOperator(10, 10, Operator.unknown), null);
    });

    // 후위표기식 변환
    test('convertPostfix test (\'10 + 10 * 10\' to [10,10,10,*,+])', () {
      expect(calculator.convertPostfix('10 + 10 * 10'), ['10', '10', '10', '*', '+']);
    });

    // 계산식 계산
    test('calculate test (\'10 + 10 * 10\' to 110)', () {
      expect(calculator.calculate('10 + 10 * 10'), 110);

      expect(calculator.calculate('10+10*10'), null);

      expect(calculator.calculate('10 + 1,010'), null);
    });
  });
}
