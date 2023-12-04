import 'package:flutter/foundation.dart';
import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.logger.dart';
import 'package:healthcheck/app/app.router.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/services/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class HomeViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final HiveService _hiveService = locator<HiveService>();
  final log = getLogger('HomeViewModel');
  final ValueListenable cartListenable =
      Hive.box<MedicalTest>('cart').listenable();
  List<MedicalTest> get cart => cartListenable.value.values.toList();
  final ThemeService _themeService = locator<ThemeService>();
  final RouterService _routerService = locator<RouterService>();

  switchThemes() {
    if (_themeService.isDarkMode) {
      _themeService.setThemeMode(ThemeManagerMode.light);
    } else {
      _themeService.setThemeMode(ThemeManagerMode.dark);
    }
  }

  void openDetails(
    MedicalTest test, {
    bool isPackage = false,
    bool inCart = false,
  }) {
    _routerService.navigateToDetailsView(
      test: test,
      cartListenable: cartListenable,
      onAddToCart: () => addToCart(test),
      isPackage: isPackage,
    );
  }

  initializeModel() {
    log.i(cart);
  }

  openUserHistory() {
    _routerService.navigateToAppointmentHistoryView();
  }

  bool isAddedToCart(MedicalTest test) => cart.contains(test);

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
