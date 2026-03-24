import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Loginprovider extends ChangeNotifier {
  String name = "";
  String desig = "";
  // String? password;
  bool login(String name, String desig, String password) {
    if (password == "1234") {
      var box = Hive.box("loginbox");
      box.put("islogin", true);

      username(name);
      designation(desig);
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
    var box = Hive.box("loginbox");
    box.put("name", name);
    notifyListeners();
  }

  void loadUsername() {
    var box = Hive.box("loginbox");
    name = box.get("name", defaultValue: ""); // ✅ assign value
    // print("Loaded name: $name"); // debug
    notifyListeners();
  }

  void designation(String newdesig) {
    desig = newdesig;
    var box = Hive.box("loginbox");
    box.put("desig", desig);
    notifyListeners();
  }

  void loaddesig() {
    var box = Hive.box("loginbox");
    desig = box.get("desig", defaultValue: "");
    print("Load desig : $desig");
    notifyListeners();
  }
}
