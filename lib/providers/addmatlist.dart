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

  void addconsign(Materialitem item, int qty) {
    item.matinitstk = item.matinitstk + qty;
    item.save();
    notifyListeners();
  }

  String? addconsume(Materialitem item, int pcs) {
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

  Map<String, int> unitcount() {
    int kg = 0;
    int pcs = 0;

    for (var item in material) {
      if (item.unit.toLowerCase() == "kg") {
        kg = kg + item.matinitstk;
        item.save();
      } else if (item.unit.toLowerCase() == "pcs") {
        pcs = pcs + item.matinitstk;
        item.save();
        // loadmaterial();
      }
    }

    return {"kg": kg, "pcs": pcs};
  }
}
