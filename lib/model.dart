import 'package:flutter/material.dart';
import '/Api.dart';

import 'dart:convert';


CheckBoxState checkBoxStateFromJson(String str) => CheckBoxState.fromJson(json.decode(str));

String checkBoxStateToJson(CheckBoxState data) => json.encode(data.toJson());

class CheckBoxState {
  String id;
  String title;
  bool done;

  CheckBoxState({
    required this.id,
    required this.title,
    this.done = false,

  });

  

     Map<String, dynamic> toJson() {
      return {
        'title': title,
        'done': done,
      };
  }

  factory CheckBoxState.fromJson(Map<String, dynamic> json) => CheckBoxState(
      id: json['id'],
      title: json['title'],
      done: json['done'],  
      );

  }


class MyState extends ChangeNotifier {
   List<CheckBoxState> _list = [];

  List<CheckBoxState> get list => _list;

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  Future getList() async {
    List<CheckBoxState> list = await Api.getList();
    _list = list;
    notifyListeners();
  }

   /*void addBox(CheckBoxState checkbox) async {
     _list = await Api.addBox(checkbox);
    notifyListeners();
  }*/
  void addBox(CheckBoxState checkbox) {
    _list.add(checkbox);
    notifyListeners();
  }

  void setDoneCheckList(CheckBoxState checkbox, bool done) {
    checkbox.done = !checkbox.done;
    notifyListeners();
  }

   void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  
  void removeBox(CheckBoxState checkbox) async {
    _list = await Api.removeBox(checkbox.id);
    notifyListeners();
    }
  

 /*void setDoneCheckList(CheckBoxState checkbox, bool done) async {
    checkbox.done = !checkbox.done;
    _list = await Api.setDoneCheckList(checkbox,checkbox.id);
    notifyListeners();
  }*/

 

  /*void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }*/
}

