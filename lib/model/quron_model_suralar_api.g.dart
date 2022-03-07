// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quron_model_suralar_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuronmodelapiAdapter extends TypeAdapter<Quron_model_api> {
  @override
  final int typeId = 0;

  @override
  Quron_model_api read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quron_model_api(
      number: fields[0] as int?,
      name: fields[1] as String?,
      englishName: fields[2] as String?,
      englishNameTranslation: fields[3] as String?,
      revelationType: fields[4] as String?,
      ayahs: (fields[5] as List?)?.cast<Ayahs>(),
    );
  }

  @override
  void write(BinaryWriter writer, Quron_model_api obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuronmodelapiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AyahsAdapter extends TypeAdapter<Ayahs> {
  @override
  final int typeId = 1;

  @override
  Ayahs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ayahs(
      number: fields[0] as int?,
      text: fields[1] as String?,
      numberInSurah: fields[2] as int?,
      juz: fields[3] as int?,
      manzil: fields[4] as int?,
      page: fields[5] as int?,
      ruku: fields[6] as int?,
      hizbQuarter: fields[7] as int?,
      sajda: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Ayahs obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.numberInSurah)
      ..writeByte(3)
      ..write(obj.juz)
      ..writeByte(4)
      ..write(obj.manzil)
      ..writeByte(5)
      ..write(obj.page)
      ..writeByte(6)
      ..write(obj.ruku)
      ..writeByte(7)
      ..write(obj.hizbQuarter)
      ..writeByte(8)
      ..write(obj.sajda);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyahsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
