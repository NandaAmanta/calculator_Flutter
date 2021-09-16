import 'package:flutter/material.dart';

class CalButtonWidget extends StatefulWidget {
  final String textButton;
  final fungsi;
  final isEqual;
  const CalButtonWidget({Key? key, required this.textButton,this.fungsi , this.isEqual = false}) : super(key: key);

  @override
  _CalButtonWidgetState createState() =>
      _CalButtonWidgetState(textButton: textButton,fungsi: fungsi,isEqual: isEqual);
}

class _CalButtonWidgetState extends State<CalButtonWidget> {

  final String textButton;
  final fungsi;
  final isEqual;
  _CalButtonWidgetState({required this.textButton,this.fungsi,this.isEqual});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed:fungsi,
        child: Text(textButton,style: TextStyle(fontSize: 20),),
        style: TextButton.styleFrom(
            side: BorderSide(
                width: 1, color: const Color.fromRGBO(31, 31, 31, 1)),
            primary: Colors.white,
            backgroundColor: (isEqual) ? Colors.deepOrange : Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      ),
    );
  }
}
