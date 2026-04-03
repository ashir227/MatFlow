import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class Materialitem {
  @HiveField(0)
  String name;
  int? matinitstk;
  int? thresold;
  int? consumption;
  Materialitem({
    required this.name,
    required this.matinitstk,
    required this.thresold,
    required this.consumption,
  });
}
