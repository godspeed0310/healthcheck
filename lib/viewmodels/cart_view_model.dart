import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.router.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/services/hive_service.dart';
import 'package:healthcheck/services/picker_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class CartViewModel extends BaseViewModel {
  DateTime? _selectedDateTime;
  DateTime? get selectedDateTime => _selectedDateTime;
  final TextEditingController dateController = TextEditingController();
  bool get isValid =>
      _selectedDateTime != null && conditionsAccepted && tests.isNotEmpty;
  final HiveService _hiveService = locator<HiveService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  bool conditionsAccepted = false;
  final RouterService _routerService = locator<RouterService>();
  final ValueListenable cartListenable =
      Hive.box<MedicalTest>('cart').listenable();
  List<MedicalTest> get tests => cartListenable.value.values.toList();
  final DialogService _dialogService = locator<DialogService>();
  final PickerService _pickerService = locator<PickerService>();

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

  int totalAmount() {
    int totalAmount = 0;
    for (var test in tests) {
      totalAmount += test.price;
    }
    return totalAmount;
  }

  int discountedPrice() {
    int discountedPrice = 0;

    for (var test in tests) {
      if (test.discountedPrice != null) {
        int discount = test.price - test.discountedPrice!;
        discountedPrice += discount;
      }
    }
    return discountedPrice;
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

  uploadPrescription() async {
    await _pickerService.getFile();
  }

  void completeTransaction() async {
    Appointment appointment = Appointment(
      id: const Uuid().v4(),
      tests: tests,
      scheduledDate: _selectedDateTime!,
    );
    await _hiveService.clearCart();
    _hiveService.createAppointment(appointment);

    await _routerService.replaceWithTransactionSuccessView(
      appointment: appointment,
    );
    _hiveService.clearCart();
  }

  updateDate(DateTime? date, BuildContext context) {
    if (date != null) {
      _selectedDateTime = date;
      dateController.text = DateFormat('d/M/y (h a)').format(date);
      notifyListeners();
    }
  }
}
