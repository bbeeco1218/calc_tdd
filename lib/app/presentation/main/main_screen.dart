import 'package:calc_test/app/presentation/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => context.read<MainBloc>().add(MainInputChanged(value)),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<MainBloc>().add(MainCalcButtonPressed());
            },
            child: const Text('계산하기'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BlocSelector<MainBloc, MainState, String>(
              selector: (state) => state.calcResult,
              builder: (context, calcResult) {
                return Text(calcResult);
              },
            ),
          ),
        ],
      ),
    );
  }
}
