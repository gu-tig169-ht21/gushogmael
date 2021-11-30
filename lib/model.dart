import 'package:flutter/material.dart';
import '/Api.dart';

class CheckBoxState {
  String id;
  String title;
  bool done;

  CheckBoxState({
    required this.id,
    required this.title,
    this.done = false,
  });

  static Map<String, dynamic> toJson(checkbox) {
    return {
      'title': checkbox.title,
      'done': checkbox.done,
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

  //bool _loading = false;
  //bool get loading => _loading;

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  Future getList() async {
    //_loading = true;
    //notifyListeners();
    List<CheckBoxState> list = await Api.getList();
    _list = list;
    //_loading = false;
    notifyListeners();
  }

  void addBox(CheckBoxState checkbox) async {
    _list = await Api.addCheckBox(checkbox);
    notifyListeners();
  }

  void removeBox(CheckBoxState checkbox) async {
    _list = await Api.deleteBox(checkbox.id);
    notifyListeners();
  }

  void setDoneCheckList(CheckBoxState checkbox, bool done) async {
    checkbox.done = !checkbox.done;
    _list = await Api.changeCheckList(checkbox, checkbox.id);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
