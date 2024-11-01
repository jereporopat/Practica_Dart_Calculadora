import 'package:flutter/material.dart';

class listViewPage extends StatefulWidget {
  const listViewPage({super.key});

  @override
  State<listViewPage> createState() => _listViewPageState();
}

class _listViewPageState extends State<listViewPage> {
  final List<String> nombres = <String>["Numero1", "Numero2", "Numero3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview"),
      ),
      body: ListView.builder(
          itemCount: nombres.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 60.0,
              child: Center(
                child: Text("Texto ${nombres[index]}"),
              ),
            );
          }),
    );
  }
}
