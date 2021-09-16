import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kalkulator/widget/m_button_widget.dart';
import 'button_widget.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String userInput = "";
  String result = "0";
  String operation = "";
  List<String> textCalButton = [
    "%",
    "CE",
    "C",
    "DEL",
    "1/x",
    "X^2",
    "2√x",
    ":",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Standard",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: 14,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.tab_sharp))
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
      ),
      drawer: Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(userInput + operation,
                style: TextStyle(color: Colors.white)),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              result.toString(),
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 15),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: 3),
                    child: MButtonWidget(
                      textMButton: "MC",
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: 3),
                    child: MButtonWidget(
                      textMButton: "MR",
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: 3),
                    child: MButtonWidget(
                      textMButton: "M+",
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: 3),
                    child: MButtonWidget(
                      textMButton: "M-",
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: 3),
                    child: MButtonWidget(
                      textMButton: "MS",
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: 3),
                    child: MButtonWidget(
                      textMButton: "Mv",
                    )),
              ),
            ],
          ),
          Expanded(
              child: Container(
                  child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 10.7 / 9),
            itemCount: textCalButton.length,
            itemBuilder: (BuildContext _, int index) {
              if (textCalButton[index] == "DEL") {
                print("eya");
                return CalButtonWidget(
                  textButton: textCalButton[index],
                  fungsi: () {
                    setState(() {
                      if (result[0] != "0") {
                        result = result.substring(0, result.length - 1);
                        if (result.isEmpty) {
                          result = "0";
                        }
                      }
                    });
                  },
                );
              }

              if (textCalButton[index] == "+" ||
                  textCalButton[index] == "-" ||
                  textCalButton[index] == "x" ||
                  textCalButton[index] == ":" ||
                  textCalButton[index] == "%") {
                return CalButtonWidget(
                    textButton: textCalButton[index],
                    fungsi: () {
                      setState(() {
                        operation = textCalButton[index];
                        userInput = result;
                        result = "0";
                      });
                    });
              }

              if (textCalButton[index] == "=") {
                return CalButtonWidget(
                  textButton: textCalButton[index],
                  fungsi: () {
                    setState(() {
                      var kiri;
                      var kanan;

                      if (result.contains(".") || userInput.contains(".")) {
                        kiri = double.parse(userInput);
                        kanan = double.parse(result);
                      } else {
                        kiri = int.parse(userInput);
                        kanan = int.parse(result);
                      }
                      if (operation == "+") {
                        result = (kiri + kanan).toString();
                      } else if (operation == "-") {
                        result = (kiri - kanan).toString();
                      } else if (operation == "x") {
                        result = (kiri * kanan).toString();
                      } else if (operation == ":") {
                        result = (kiri / kanan).toString();
                      } else if (operation == "%") {
                        result = (kiri % kanan).toString();
                      }
                      if (result.contains(".")) {
                        if (int.parse(result.split(".").last) == 0) {
                          result = result.split(".").first;
                        }
                      }
                      userInput = "";
                      operation = "";
                    });
                  },
                  isEqual: true,
                );
              }
              if(textCalButton[index] == "X^2" ){
                return CalButtonWidget(
                    textButton: textCalButton[index],
                    fungsi: () {
                      setState(() {
                        userInput = "sqrt(${result})";
                        result = (int.parse(result) * int.parse(result)).toString();
                        operation = "";
                      });
                    });
              }
              if (textCalButton[index] == "C") {
                return CalButtonWidget(
                    textButton: textCalButton[index],
                    fungsi: () {
                      setState(() {
                        userInput = "";
                        result = "0";
                        operation = "";
                      });
                    });
              }
              if (textCalButton[index] == "CE") {
                return CalButtonWidget(
                    textButton: textCalButton[index],
                    fungsi: () {
                      setState(() {
                        result = "0";
                      });
                    });
              }
              if (textCalButton[index] == "+/-") {
                return CalButtonWidget(
                    textButton: textCalButton[index],
                    fungsi: () {
                      setState(() {
                        if (result[0] != '0') {
                          if (result[0] == "-") {
                            result = result.substring(1);
                          } else {
                            result = "-" + result;
                          }
                        }
                      });
                    });
              }

              if (textCalButton[index] == ".") {
                return CalButtonWidget(
                  textButton: textCalButton[index],
                  fungsi: () {
                    setState(() {
                      if (!result.contains(".")) {
                        result += textCalButton[index];
                      }
                    });
                  },
                );
              }

              return CalButtonWidget(
                textButton: textCalButton[index],
                fungsi: () {
                  setState(() {
                    if (result.contains(".")) {
                      result += textCalButton[index];
                    } else if (result[0] == "0") {
                      result = textCalButton[index];
                    } else {
                      result += textCalButton[index];
                    }
                  });
                },
              );
            },
          )))
        ],
      ),
    );
  }
}
