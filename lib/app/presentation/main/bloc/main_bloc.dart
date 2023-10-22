import 'package:calc_test/app/util/calculator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

typedef MainEmitter = Emitter<MainState>;

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.initial()) {
    on<MainInputChanged>(_onInputChanged);
    on<MainCalcButtonPressed>(_onCalcButtonPressed);
  }

  void _onInputChanged(MainInputChanged event, MainEmitter emit) {
    emit(state.copyWith(inputExpression: event.input));
  }

  void _onCalcButtonPressed(_, MainEmitter emit) {
    final Calculator calculator = Calculator();
    final double? result = calculator.calculate(state.inputExpression);

    if (result == null) {
      emit(state.copyWith(calcResult: '올바른 식을 넣어주세요.'));
      return;
    }

    emit(state.copyWith(calcResult: '결과 : $result'));
  }
}
