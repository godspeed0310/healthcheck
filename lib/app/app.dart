import 'package:healthcheck/services/hive_service.dart';
import 'package:healthcheck/services/notification_service.dart';
import 'package:healthcheck/services/picker_service.dart';
import 'package:healthcheck/views/home_view.dart';
import 'package:healthcheck/views/transaction_success.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

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
    LazySingleton(classType: PickerService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class App {}
