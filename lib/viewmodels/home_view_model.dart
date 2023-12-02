import 'package:flutter/foundation.dart';
import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.logger.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/services/hive_service.dart';
import 'package:healthcheck/services/notification_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NotificationService _notificationService =
      locator<NotificationService>();
  final HiveService _hiveService = locator<HiveService>();
  final log = getLogger('HomeViewModel');
  final ValueListenable cartListenable =
      Hive.box<MedicalTest>('cart').listenable();
  List<MedicalTest> get cart => cartListenable.value.values.toList();

  initializeModel() {
    log.i(cart);
  }

  bool isAddedToCart(MedicalTest test) {
    return cart.contains(test);
  }

  void addToCart(MedicalTest test) {
    if (isAddedToCart(test)) {
      cart.remove(test);
      _hiveService.removeFromCart(test);
      notifyListeners();
      _snackbarService.showSnackbar(
        message: 'Removed from cart',
        duration: 3.s,
      );
    } else {
      cart.add(test);
      _hiveService.addToCart(test);
      notifyListeners();
      _snackbarService.showSnackbar(
        message: 'Added to cart',
        duration: 3.s,
      );
    }
  }
}
