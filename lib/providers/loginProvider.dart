import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Loginprovider extends ChangeNotifier {
  bool login(String name, String password) {
    if (name == "admin" && password == "1234") {
      var box = Hive.box("loginbox");
      // String? savedname = box.put("name", name);
      box.put("password", password);
      notifyListeners();
    }
    return true;
  }
}
