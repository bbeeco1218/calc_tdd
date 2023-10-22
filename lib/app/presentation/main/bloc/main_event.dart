part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class MainInputChanged extends MainEvent {
  const MainInputChanged(this.input);

  final String input;

  @override
  List<Object> get props => [input];
}

class MainCalcButtonPressed extends MainEvent {}
