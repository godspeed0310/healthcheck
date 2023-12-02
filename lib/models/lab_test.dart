import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'lab_test.freezed.dart';
part 'lab_test.g.dart';

@freezed
@HiveType(typeId: 0)
class LabTest with _$LabTest {
  const factory LabTest({
    @HiveField(0) required String name,
    @HiveField(1) required String description,
    @HiveField(3) required int price,
    @HiveField(4) int? discountedPrice,
    @HiveField(5) required List<String> tests,
  }) = _LabTest;

  factory LabTest.fromJson(Map<String, dynamic> json) =>
      _$LabTestFromJson(json);
}
