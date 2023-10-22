part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({
    required this.inputExpression,
    required this.calcResult,
  });

  factory MainState.initial() {
    return const MainState(
      inputExpression: '',
      calcResult: '',
    );
  }

  MainState copyWith({
    String? inputExpression,
    String? calcResult,
  }) {
    return MainState(
      inputExpression: inputExpression ?? this.inputExpression,
      calcResult: calcResult ?? this.calcResult,
    );
  }

  final String inputExpression;
  final String calcResult;

  // bool get isMathExpression {
  //   RegExp regex = RegExp(r'^[0-9]+(\.[0-9]+)?\s([+\-*/]\s[0-9]+(\.[0-9]+)?\s)*[+\-*/]\s[0-9]+(\.[0-9]+)?$');
  //   return regex.hasMatch(inputExpression);
  // }

  @override
  List<Object> get props => [
        inputExpression,
        calcResult,
      ];
}
