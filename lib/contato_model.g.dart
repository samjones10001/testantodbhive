// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContatoModelAdapter extends TypeAdapter<ContatoModel> {
  @override
  final int typeId = 0;

  @override
  ContatoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContatoModel(
      nome: fields[0] as String,
      endereco: fields[1] as String,
      telefone: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContatoModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.endereco)
      ..writeByte(2)
      ..write(obj.telefone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContatoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
