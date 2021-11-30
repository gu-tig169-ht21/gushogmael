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

  String _filterBy = 'All';

  String get filterBy => _filterBy;

  Future getList() async {
    List<CheckBoxState> list = await Api.getCheckbox();
    _list = list;
    notifyListeners();
  }

  void removeBox(CheckBoxState checkbox) async {
    _list = await Api.deleteCheckbox(checkbox.id);
    notifyListeners();
  }

  void setDoneCheckList(CheckBoxState checkbox, bool done) async {
    checkbox.done = !checkbox.done;
    _list = await Api.changeCheckList(checkbox, checkbox.id);
    notifyListeners();
  }

  void addBox(CheckBoxState checkbox) async {
    _list = await Api.addCheckbox(checkbox);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}
