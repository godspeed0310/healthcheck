import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.logger.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/services/notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NotificationService _notificationService =
      locator<NotificationService>();
  final log = getLogger('HomeViewModel');

  init() {
    _notificationService.initialize();
  }

  void addToCart(MedicalTest test) {
    _snackbarService.showSnackbar(
      message: 'Added to cart',
      duration: 1.s,
    );
  }
}
