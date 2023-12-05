import 'package:flutter/material.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/views/transaction_succeess/transaction_success.desktop.dart';
import 'package:healthcheck/views/transaction_succeess/transaction_success.mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TransactionSuccessView extends StatelessWidget {
  final Appointment appointment;
  const TransactionSuccessView({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => TransactionSuccessViewMobile(appointment: appointment),
      desktop: (_) => TransactionSuccessViewDesktop(appointment: appointment),
    );
  }
}
