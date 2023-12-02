import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.router.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/services/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  DateTime? _selectedDateTime;
  DateTime? get selectedDateTime => _selectedDateTime;
  final TextEditingController dateController = TextEditingController();
  bool get isValid => _selectedDateTime != null && conditionsAccepted;
  final HiveService _hiveService = locator<HiveService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  bool conditionsAccepted = false;
  final NavigationService _navigationService = locator<NavigationService>();
  final ValueListenable cartListenable =
      Hive.box<MedicalTest>('cart').listenable();
  List<MedicalTest> get tests => cartListenable.value.values.toList();
  final DialogService _dialogService = locator<DialogService>();

  void clearCart(BuildContext context) async {
    DialogResponse? response = await _dialogService.showConfirmationDialog(
      title: 'Clear Cart',
      description: 'Are you sure you want to clear your cart?',
      cancelTitle: 'No',
      confirmationTitle: 'Yes',
      cancelTitleColor: context.primaryColor,
      barrierDismissible: true,
    );
    if (response?.confirmed == true) {
      _hiveService.clearCart();
      notifyListeners();
    }
  }

  void setConditionStatus(bool value) {
    conditionsAccepted = value;
    notifyListeners();
  }

  void removeFromCart(MedicalTest test) {
    tests.remove(test);
    _hiveService.removeFromCart(test);
    notifyListeners();
    _snackbarService.showSnackbar(
      message: 'Removed from cart',
      duration: 3.s,
    );
  }

  void completeTransaction() {
    Appointment appointment = Appointment(
      id: '1',
      tests: tests,
      scheduledDate: _selectedDateTime!,
    );

    _navigationService.replaceWithTransactionSuccessView(
      appointment: appointment,
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
