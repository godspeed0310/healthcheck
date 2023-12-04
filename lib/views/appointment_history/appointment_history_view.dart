import 'package:flutter/material.dart';
import 'package:healthcheck/views/appointment_history/appointment_history_view.desktop.dart';
import 'package:healthcheck/views/appointment_history/appointment_history_view.mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppointmentHistoryView extends StatelessWidget {
  const AppointmentHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AppointmentHistoryViewMobile(),
      desktop: (_) => const AppointmentHistoryViewDesktop(),
    );
  }
}
