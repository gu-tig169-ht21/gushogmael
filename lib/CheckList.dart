// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model.dart';

class CheckList extends StatelessWidget {
  List<CheckBoxState> list;

  CheckList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            list.map((checkbox) => _buildCheckbox(context, checkbox)).toList());
  }

  Widget _buildCheckbox(context, CheckBoxState checkbox) => CheckboxListTile(
        contentPadding: const EdgeInsets.all(12.0),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(checkbox.title,
            style: TextStyle(
                decoration: checkbox.done ? TextDecoration.lineThrough : null)),
        onChanged: (value) {
          var state = Provider.of<MyState>(context, listen: false);
          state.setDoneCheckList(checkbox, false);
        },
        value: checkbox.done,
        secondary: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<MyState>(context, listen: false)
                  .removeBox(checkbox); //ta bort
            }),
      );
}
