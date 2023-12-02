import 'package:flutter/material.dart';
import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ScheduleViewModel extends BaseViewModel {
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  bool get isValid => selectedDate != null && selectedTime != null;
  bool get isDateSelected => selectedDate != null;

  final NavigationService _navigationService = locator<NavigationService>();

  final log = getLogger('ScheduleViewModel');

  initializeModel(DateTime? dateTime) {
    if (dateTime != null) {
      selectedDate = dateTime;
      selectedTime = TimeOfDay.fromDateTime(dateTime);
      notifyListeners();
    }
  }

  List<TimeOfDay> timeslots = [
    const TimeOfDay(hour: 09, minute: 00),
    const TimeOfDay(hour: 10, minute: 00),
    const TimeOfDay(hour: 11, minute: 00),
    const TimeOfDay(hour: 12, minute: 00),
    const TimeOfDay(hour: 13, minute: 00),
    const TimeOfDay(hour: 14, minute: 00),
    const TimeOfDay(hour: 15, minute: 00),
    const TimeOfDay(hour: 16, minute: 00),
    const TimeOfDay(hour: 17, minute: 00),
    const TimeOfDay(hour: 18, minute: 00),
    const TimeOfDay(hour: 19, minute: 00),
    const TimeOfDay(hour: 20, minute: 00),
  ];

  setSelectedTime(TimeOfDay selection) {
    selectedTime = selection;
    notifyListeners();
  }

  setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  onSubmit() {
    DateTime finalDate = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );
    _navigationService.back<DateTime?>(result: finalDate);
  }
}
