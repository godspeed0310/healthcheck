import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.logger.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final log = getLogger('HomeViewModel');

  void addToCart(MedicalTest test) {
    _snackbarService.showSnackbar(
      message: 'Added to cart',
      duration: 1.s,
    );
  }
}
