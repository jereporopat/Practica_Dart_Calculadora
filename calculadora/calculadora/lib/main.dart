import 'package:calculadora/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _historial = "";
  String _expresion = "";
  void allClear(String text) {
    setState(() {
      _historial = "";
      _expresion = "";
    });
  }
  void clear(String text) {
    setState(() {
      _expresion = "";
    });
  }
  void evaluar(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expresion);
    ContextModel cm = ContextModel();
    setState(() {
      _historial = _expresion;
      _expresion = exp.evaluate(EvaluationType.REAL, cm).toString();

    });
  }
  void numClick(String text){
    setState(() {
      _expresion+= text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _historial,
                    style: GoogleFonts.rubik(
                        textStyle:
                            const TextStyle(fontSize: 24, color: Colors.black)),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: (Text(_expresion,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 48, color: Colors.white)))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    bgcolor: 0xFF00BF45,
                    text: "AC",
                    callback: allClear,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xFFcc0000,
                    text: "C",
                    callback: clear,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "%",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "/",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "7",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "8",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "9",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "*",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "4",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "5",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "6",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "-",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "1",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "2",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "3",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "+",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: ".",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "0",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "00",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "=",
                    callback: evaluar,
                    textSize: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
