import 'package:flutter/material.dart';

class CollectionProvider extends ChangeNotifier {
  int _itemSelected = 0;
  String _mobileNumber = "";
  double _amount = 0;

  int get itemSelected => _itemSelected;
  String get mobileNumber => _mobileNumber;
  double get amount => _amount;

  void setItemSelected(int item) {
    _itemSelected = item;
    notifyListeners();
  }

  void setMobileNumber(String mobileNumber) {
    _mobileNumber = mobileNumber;
    notifyListeners();
  }

  void setAmount(double amount) {
    _amount = amount;
    notifyListeners();
  }
}
