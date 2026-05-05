import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/models/material_item.dart';

class AddmatProvider extends ChangeNotifier {
  List<Materialitem> material = [];
  // AddmatProvider();
  String? addmaterial(Materialitem newmatitems) {
    var box = Hive.box("materials");
    box.add(newmatitems);

    material = box.values.cast<Materialitem>().toList();

    notifyListeners();
    return null;
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

  void addconsign(Materialitem item, double qty) {
    item.matinitstk = item.matinitstk + qty;
    item.save();
    notifyListeners();
  }

  String? addconsume(Materialitem item, double pcs) {
    var PcsCon = pcs * item.consumption;
    if (PcsCon <= item.matinitstk) {
      item.matinitstk = item.matinitstk - PcsCon;
      item.save();
      notifyListeners();
      return null;
    } else {
      return "Not enough stock available";
    }
  }

  void unitcount() {
    double totalpcs = 0;
    double totalkg = 0;
    for (var units in material) {
      if (units.unit == "KG") {
        totalkg = units.matinitstk + totalkg;
        notifyListeners();
      } else {
        totalpcs = units.matinitstk + totalpcs;
        notifyListeners();
      }
    }
  }
}
