import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/models/MaterialItem.dart';

class AddmatProvider extends ChangeNotifier {
  List<Materialitem> material = [];
  AddmatProvider();
  void addmaterial(Materialitem mat) {
    var box = Hive.box("materials");
    box.add(mat);
    material = box.values.cast<Materialitem>().toList();
  }
}
