import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '/model.dart';
import 'CheckListview.dart';

void main() { //sätt en await längre ner för ex get, add osv
  var state = MyState();
  state.getList();
  runApp(
      ChangeNotifierProvider(create: (context) => state, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CheckBoxListView(),
    );
  }
}
