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

  void deletematerial(Material newmatitems) {
    List<Materialitem> material = [];

    var box = Hive.box("material");

    box.delete(newmatitems);

    notifyListeners();
  }
}
