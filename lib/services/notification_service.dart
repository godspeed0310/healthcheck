import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:healthcheck/app/app.logger.dart';

class NotificationService {
  final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  final log = getLogger('NotificationService');

  void initialize() {
    awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Order Notifications',
          channelDescription: 'Notification channel for basic tests',
        ),
      ],
    );
    log.i('Notification Service initialized');
  }

  void requestPermissions() {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void showScheduleNotification({required String title}) async {
    bool isPermissionGranted =
        await awesomeNotifications.isNotificationAllowed();
    if (isPermissionGranted) {
      awesomeNotifications.createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: title,
          body: 'Thank you for your order!',
        ),
      );
    } else {
      requestPermissions();
    }
  }
}
