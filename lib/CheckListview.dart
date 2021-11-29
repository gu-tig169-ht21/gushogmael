// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/CheckList.dart';
import '/model.dart';
import 'SecondView.dart';

class CheckBoxListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TIG169 TODO",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          PopupMenuButton(
              onSelected: (String value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('All'), value: 'All'),
                    const PopupMenuItem(child: Text('Done'), value: 'Done'),
                    const PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            CheckList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var newBox = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondView(CheckBoxState(
                    title: 'title', 
                    id: '', 
                    ))));
  
          if (newBox != null) {
            Provider.of<MyState>(context, listen: false).addBox(newBox);
          }
        },
      ),
    );
  }

  List<CheckBoxState> _filterList(list, filterBy) {
    if (filterBy == "Done") {
      return list.where((checkbox) => checkbox.done == true).toList();
    } if (filterBy == "Undone") {
     return list.where((checkbox) => checkbox.done == false).toList();
    }
    return list;
  }
}
