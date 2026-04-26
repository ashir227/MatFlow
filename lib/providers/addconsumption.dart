import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:matflow/models/mateial_Con.dart';
import 'package:matflow/models/material_item.dart';

class Consumeprovider extends ChangeNotifier {
  String? PicesPro;
  String? consumuption;

  addconsumption(ConModel newcons) {
    var box = Hive.box("materials");
    box.add(newcons);
    notifyListeners();
  }
}
