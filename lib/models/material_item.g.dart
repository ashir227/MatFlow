// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialitemAdapter extends TypeAdapter<Materialitem> {
  @override
  final int typeId = 0;

  @override
  Materialitem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Materialitem(
      name: fields[0] as String,
      consumption: fields[1] as int,
      matinitstk: fields[2] as int,
      thresold: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Materialitem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.consumption)
      ..writeByte(2)
      ..write(obj.matinitstk)
      ..writeByte(3)
      ..write(obj.thresold);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialitemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
