import 'package:flutter/material.dart';
import 'package:healthcheck/views/schedule_view/schedule_view.desktop.dart';
import 'package:healthcheck/views/schedule_view/schedule_view.mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScheduleView extends StatelessWidget {
  final DateTime? previousDate;

  const ScheduleView({super.key, this.previousDate});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => ScheduleViewMobile(previousDate: previousDate),
      desktop: (_) => ScheduleViewDesktop(previousDate: previousDate),
    );
  }
}
