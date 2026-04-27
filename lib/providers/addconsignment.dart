import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/models/material_consig.dart';
import 'package:matflow/models/material_item.dart';

class ConsigProvider extends ChangeNotifier {
  Materialitem? select;
  addconsig(ConsigModel newconsig) {
    var box = Hive.box("materials");
    box.add(newconsig);

    var items = select!.matinitstk;
    var minus = items + newconsig.Qty!;
    notifyListeners();
    print(minus);
  }

  loadconsig() {}
}
