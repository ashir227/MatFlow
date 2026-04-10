import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/models/material_item.dart';

class AddmatProvider extends ChangeNotifier {
  List<Materialitem> material = [];
  // AddmatProvider();
  void addmaterial(Materialitem newmatitems) {
    var box = Hive.box("materials");
    box.add(newmatitems);

    material = box.values.cast<Materialitem>().toList();

    notifyListeners();
  }

  void loadmaterial() {
    var box = Hive.box("materials");
    material = box.values.cast<Materialitem>().toList();

    notifyListeners();
  }

  void deletematerial(Materialitem item) {
    //Is me item is liye banaya ha ke ye material model me se batay ga kon sa index wali key delete karni ha
    // List<Materialitem> material = [];

    var box = Hive.box("materials");

    item.delete();
    material = box.values.cast<Materialitem>().toList();

    notifyListeners();
  }
}
