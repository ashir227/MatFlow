import 'package:hive/hive.dart';

part 'material_item.g.dart';

@HiveType(typeId: 0)
class Materialitem extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int matinitstk;

  @HiveField(2)
  int thresold;

  @HiveField(3)
  int consumption;

  Materialitem({
    required this.name,
    required this.matinitstk,
    required this.thresold,
    required this.consumption,
  });
}
