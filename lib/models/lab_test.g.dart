// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_test.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LabTestAdapter extends TypeAdapter<LabTest> {
  @override
  final int typeId = 0;

  @override
  LabTest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LabTest(
      name: fields[0] as String,
      description: fields[1] as String,
      price: fields[3] as int,
      discountedPrice: fields[4] as int?,
      tests: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, LabTest obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.discountedPrice)
      ..writeByte(5)
      ..write(obj.tests);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LabTestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LabTestImpl _$$LabTestImplFromJson(Map<String, dynamic> json) =>
    _$LabTestImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      discountedPrice: json['discountedPrice'] as int?,
      tests: (json['tests'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$LabTestImplToJson(_$LabTestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'tests': instance.tests,
    };
