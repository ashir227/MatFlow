import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Loginprovider extends ChangeNotifier {
  bool login(String name, String password) {
    if (name == "admin" && password == "1234") {
      var box = Hive.box("loginbox");
      box.put("islogin", true);
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    var box = Hive.box("loginbox");
    box.put("islogin", false);

    notifyListeners();
  }
}
