
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '/model.dart';

class SecondView extends StatefulWidget {
  final CheckBoxState checkbox;

  SecondView(this.checkbox);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(checkbox);
  }
}

class SecondViewState extends State<SecondView> {
  late String title;

  late TextEditingController textEditingController;

  SecondViewState(CheckBoxState checkbox) {
    this.title = checkbox.title;

    textEditingController = TextEditingController(text: checkbox.title);

    textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TIG169 TODO',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            _textBox(),
            Container(
              height: 10,
            ),
            _addNew(),
          ],
        ),
      ),
    );
  }

  Widget _textBox() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(30.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0),
            ),
            labelText: "What are you going to do?"),
      ),
    );
  }

  Widget _addNew() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: const Text('+ ADD'),
            onPressed: () {
              Navigator.pop(context, textEditingController.text);
            }),
      ],
    );
  }
}
