import 'package:flutter/material.dart';
import 'package:kalkulator/widget/calculator_widget.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31 , 1)),
      home: CalculatorWidget()
    );
  }
}

