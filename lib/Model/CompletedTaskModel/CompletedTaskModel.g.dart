// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CompletedTaskModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedTaskModelAdapter extends TypeAdapter<CompletedTaskModel> {
  @override
  final int typeId = 1;

  @override
  CompletedTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedTaskModel(
      title: fields[0] as String,
      completedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CompletedTaskModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.completedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
