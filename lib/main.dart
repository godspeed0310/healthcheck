import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcheck/app/app.locator.dart';
import 'package:healthcheck/app/app.router.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/services/hive_service.dart';
import 'package:healthcheck/services/notification_service.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await locator<HiveService>().init();
  locator<NotificationService>().initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await ThemeManager.initialise();
  runApp(const HealthCheckApp());
}

class HealthCheckApp extends StatelessWidget {
  const HealthCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ThemeBuilder(
          lightTheme: kThLight,
          darkTheme: kThDark,
          defaultThemeMode: ThemeMode.light,
          builder: (context, lightTheme, darkTheme, themeMode) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Health Check',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
