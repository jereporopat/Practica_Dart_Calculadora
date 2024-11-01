import 'package:flutter/material.dart';
import 'package:practica_0/pages/listView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista",
      home: listViewPage(),
    );
  }
}
