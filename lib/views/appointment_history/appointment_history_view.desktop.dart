import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';

class AppointmentHistoryViewDesktop extends StatelessWidget {
  const AppointmentHistoryViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSystemOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Appointment History'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Assets.illustrations.noAppointmentsIllustration.svg(
                  height: 250,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'No appointments scheduled yet',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: context.onSurface.withOpacity(0.8),
                    ),
                  ),
                  const Gap(15),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Book an appointment from the previous page to see it here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: context.onSurface.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
