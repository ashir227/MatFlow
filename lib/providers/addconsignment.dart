import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/models/material_consig.dart';

class ConsigProvider extends ChangeNotifier {
  addconsig(ConsigModel newconsig) {
    var box = Hive.box("materials");
    box.add(newconsig);
    notifyListeners();
  }
}
