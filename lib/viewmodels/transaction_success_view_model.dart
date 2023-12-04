import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.router.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/services/hive_service.dart';
import 'package:healthcheck/services/notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionSuccessViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();
  final NotificationService _notificationService =
      locator<NotificationService>();
  final HiveService _hiveService = locator<HiveService>();

  void initializeModel(Appointment appointment) {
    if (appointment.tests.length == 1) {
      _notificationService.showScheduleNotification(
        title: 'Thanks for purchasing ${appointment.tests[0].name}',
      );
    } else {
      _notificationService.showScheduleNotification(
        title: 'Thanks for purchasing ${appointment.tests.length} tests',
      );
    }
    _hiveService.createAppointment(appointment);
  }

  back() async {
    await _hiveService.clearCart();
    _routerService.clearStackAndShow(
      const PageRouteInfo(HomeViewRoute.name, path: '/'),
    );
  }
}
