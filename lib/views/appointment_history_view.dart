import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/appointment_history_view_model.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class AppointmentHistoryView extends StatelessWidget {
  const AppointmentHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentHistoryViewModel>.reactive(
      viewModelBuilder: () => AppointmentHistoryViewModel(),
      builder: (context, model, child) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Appointment History'),
            ),
            body: ValueListenableBuilder(
              valueListenable: model.historyListenable,
              builder: (_, value, __) {
                final List<Appointment> history = value.values.toList();

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  itemBuilder: (_, index) {
                    final Appointment appointment = history[index];

                    return Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.onSurface.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('d MMM y').format(
                                  appointment.scheduledDate,
                                ),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat('h a').format(
                                  appointment.scheduledDate,
                                ),
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                  color: context.onSurface.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                          ...List.generate(
                            appointment.tests.length,
                            (index) {
                              final MedicalTest test = appointment.tests[index];

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Gap(2.h),
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
                                          fontSize: 11.sp,
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
                                            fontSize: 10.sp,
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
                          Gap(2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                  color: context.onSurface.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                '₹${model.totalAmount(appointment)}',
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                    return Gap(2.h);
                  },
                  itemCount: value.values.length,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
