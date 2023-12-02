import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'medical_test.freezed.dart';
part 'medical_test.g.dart';

@freezed
@HiveType(typeId: 0)
class MedicalTest with _$MedicalTest {
  const factory MedicalTest({
    @HiveField(0) required String name,
    @HiveField(1) required String description,
    @HiveField(3) required int price,
    @HiveField(4) int? discountedPrice,
    @HiveField(5) required List<String> tests,
  }) = _MedicalTest;

  factory MedicalTest.fromJson(Map<String, dynamic> json) =>
      _$MedicalTestFromJson(json);
}
