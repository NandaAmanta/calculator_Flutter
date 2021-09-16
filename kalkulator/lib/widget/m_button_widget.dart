import 'package:flutter/material.dart';

class MButtonWidget extends StatefulWidget {
  final String textMButton;
  MButtonWidget({ Key? key,required this.textMButton}) : super(key: key);
  
  @override
  _MButtonWidgetState createState() => _MButtonWidgetState(textMButton: textMButton);
}

class _MButtonWidgetState extends State<MButtonWidget> {
  final String textMButton;
  _MButtonWidgetState({required this.textMButton});
  

  @override
  Widget build(BuildContext context) {
    
    return TextButton(
                        style: ElevatedButton.styleFrom(
                            side:
                                BorderSide(width: 1, color: Colors.transparent),
                            primary: Colors.transparent),
                        onPressed: () {},
                        child: Text(this.textMButton                          ,
                          style: TextStyle(color: Colors.white),
                        ));
  }
}