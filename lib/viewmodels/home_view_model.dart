import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();

  void addToCart() {
    _snackbarService.showSnackbar(
      message: 'Added to cart',
      duration: 1.s,
    );
  }
}
