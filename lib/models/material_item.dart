import 'package:hive/hive.dart';
part 'material_item.g.dart';

@HiveType(typeId: 0)
class Materialitem extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String unit;

  @HiveField(2)
  double consumption;
  @HiveField(3)
  double matinitstk;
  @HiveField(4)
  int thresold;

  Materialitem({
    required this.name,
    required this.unit,
    required this.consumption,
    required this.matinitstk,
    required this.thresold,
  });
}
