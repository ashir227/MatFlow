import 'package:hive/hive.dart';
part 'material_item.g.dart';

@HiveType(typeId: 0)
class Materialitem extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int consumption;
  @HiveField(2)
  double matinitstk;
  @HiveField(3)
  int thresold;
  @HiveField(4)
  String unit;
  Materialitem({
    required this.name,
    required this.consumption,
    required this.matinitstk,
    required this.thresold,
    required this.unit,
  });
}
