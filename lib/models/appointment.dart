import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
@HiveType(typeId: 1)
class Appointment with _$Appointment {
  const factory Appointment({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime scheduledDate,
    @HiveField(2) required List<MedicalTest> tests,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
