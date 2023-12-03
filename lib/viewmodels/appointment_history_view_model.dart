import 'package:flutter/foundation.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

class AppointmentHistoryViewModel extends BaseViewModel {
  final ValueListenable historyListenable =
      Hive.box<Appointment>('appointments').listenable();

  int totalAmount(Appointment appointment) {
    int discountedPrice = 0;

    for (var test in appointment.tests) {
      if (test.discountedPrice != null) {
        int price = test.discountedPrice ?? test.price;
        discountedPrice += price;
      }
    }
    return discountedPrice;
  }
}
