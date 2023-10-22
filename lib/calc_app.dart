import 'package:calc_test/app/presentation/main/bloc/main_bloc.dart';
import 'package:calc_test/app/presentation/main/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => MainBloc(),
        child: const MainScreen(),
      ),
    );
  }
}
