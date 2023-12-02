import 'package:healthcheck/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionSuccessViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  get back => _navigationService.back();
}
