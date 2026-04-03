import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/models/MaterialItem.dart';

class AddmatProvider extends ChangeNotifier {
  List<Materialitem> material = [];
  // AddmatProvider();
  void addmaterial(Materialitem matitems) {
    var box = Hive.box("materials");
    box.add(matitems);
    material = box.values.cast<Materialitem>().toList();
    notifyListeners();
  }

  void loadmaterial() {
    var box = Hive.box("materials");
    material = box.values.cast<Materialitem>().toList();
    notifyListeners();
  }
}
