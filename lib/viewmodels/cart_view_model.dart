import 'package:flutter/material.dart';
import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.router.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  DateTime? _selectedDateTime;
  DateTime? get selectedDateTime => _selectedDateTime;
  final TextEditingController dateController = TextEditingController();
  bool get isValid => _selectedDateTime != null && conditionsAccepted;
  bool conditionsAccepted = false;
  final NavigationService _navigationService = locator<NavigationService>();

  void setConditionStatus(bool value) {
    conditionsAccepted = value;
    notifyListeners();
  }

  void completeTransaction() {
    _navigationService.replaceWithTransactionSuccessView(
      appointmentDate: _selectedDateTime!,
    );
  }

  updateDate(DateTime? date, BuildContext context) {
    if (date != null) {
      _selectedDateTime = date;
      dateController.text = DateFormat('d/M/y (h a)').format(date);
      notifyListeners();
    }
  }
}
