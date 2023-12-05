import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/appointment_history_view_model.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class AppointmentHistoryViewDesktop extends StatelessWidget {
  const AppointmentHistoryViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentHistoryViewModel>.reactive(
      viewModelBuilder: () => AppointmentHistoryViewModel(),
      builder: (_, model, __) {
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
                ValueListenableBuilder(
                  valueListenable: model.historyListenable,
                  builder: (_, value, __) {
                    final List<Appointment> history = value.values.toList();

                    if (history.isEmpty) {
                      return Expanded(
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
                      );
                    } else {
                      return Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          itemBuilder: (_, index) {
                            final Appointment appointment = history[index];

                            return Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.onSurface.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat('d MMM y').format(
                                          appointment.scheduledDate,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('h a').format(
                                          appointment.scheduledDate,
                                        ),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: context.onSurface
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ...List.generate(
                                    appointment.tests.length,
                                    (index) {
                                      final MedicalTest test =
                                          appointment.tests[index];

                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Gap(20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                test.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '₹ ${test.discountedPrice ?? test.price}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: context.primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ...List.generate(
                                            test.tests.length,
                                            (index) {
                                              return Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '• ${test.tests[index]}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: context.onSurface
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  const Gap(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: context.onSurface
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                      Text(
                                        '₹${model.totalAmount(appointment)}',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: context.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (_, __) {
                            return const Gap(20);
                          },
                          itemCount: value.values.length,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
