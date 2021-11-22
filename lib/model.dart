import 'package:flutter/material.dart';

class CheckBoxState {
  String title;
  String? id;
  bool value;

  CheckBoxState({
    required this.title,
    this.id,
    this.value = false,
  });
}

class MyState extends ChangeNotifier {
  final List<CheckBoxState> _list = [
    CheckBoxState(title: 'Read a book'),
    CheckBoxState(title: 'Do homework'),
    CheckBoxState(title: 'Tidy room'),
    CheckBoxState(title: 'Watch TV'),
    CheckBoxState(title: 'Nap'),
    CheckBoxState(title: 'Shop groceries'),
    CheckBoxState(title: 'Have fun'),
    CheckBoxState(title: 'Meditate'),
  ];

  List<CheckBoxState> get list => _list;

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  void setDoneCheckList(CheckBoxState checkbox, bool value) {
    checkbox.value = !checkbox.value;
    notifyListeners();
  }

  void removeBox(CheckBoxState checkbox) {
    _list.remove(checkbox);
    notifyListeners();
  }

  void addBox(CheckBoxState checkbox) {
    _list.add(checkbox);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
