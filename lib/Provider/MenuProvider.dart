import 'package:flutter/cupertino.dart';

class MenuProvider with ChangeNotifier {
  bool _showMenu = false;
  String _side;

  bool get showMenu => _showMenu;

  void switchMenu() {
    _showMenu = !_showMenu;
    notifyListeners();
  }

  String get side => _side;

  void setSide(String value) {
    _side = value;
    notifyListeners();
  }
}
