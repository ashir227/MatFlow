import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Loginprovider extends ChangeNotifier {
  String name = "";
  // String? password;
  bool login(String name, String password) {
    if (name == "admin" && password == "1234") {
      var box = Hive.box("loginbox");
      box.put("islogin", true);
      username(name);
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    var box = Hive.box("loginbox");
    box.delete("islogin");
    box.delete("Username");
    name = "";
    notifyListeners();
  }

  void username(String newname) {
    name = newname;
    var box = Hive.box("Username");
    box.put("name", name);
    notifyListeners();
  }

  void loadUsername() {
    var box = Hive.box("Username");
    name = box.get("name", defaultValue: ""); // ✅ assign value
    // print("Loaded name: $name"); // debug
    notifyListeners();
  }
}
