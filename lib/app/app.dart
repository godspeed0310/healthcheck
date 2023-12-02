import 'package:healthcheck/services/hive_service.dart';
import 'package:healthcheck/services/notification_service.dart';
import 'package:healthcheck/views/home_view.dart';
import 'package:healthcheck/views/transaction_success.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: TransactionSuccessView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: HiveService),
  ],
  logger: StackedLogger(),
)
class App {}
