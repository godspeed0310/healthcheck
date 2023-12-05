import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/views/schedule_view.dart';
import 'package:healthcheck/widgets/custom_open_container.dart';
import 'package:sizer/sizer.dart';

class CartCalendarCard extends StatelessWidget {
  final void Function(Object?)? onClosed;
  final TextEditingController dateController;
  final DateTime? previousDate;

  const CartCalendarCard({
    super.key,
    this.onClosed,
    required this.dateController,
    this.previousDate,
  });

  @override
  Widget build(BuildContext context) {
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: !kIsMobile ? 114 : 10.h,
      width: !kIsMobile ? 450 : 88.w,
      padding: EdgeInsets.only(
        left: !kIsMobile ? 8 : 5.w,
        right: !kIsMobile ? 20 : 5.3.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.onSurface.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(!kIsMobile ? 8 : 1.6.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_month_outlined),
          Gap(!kIsMobile ? 15 : 3.w),
          Expanded(
            child: CustomOpenContainer(
              closedBuilder: (_, __) {
                return TextField(
                  controller: dateController,
                  style: TextStyle(color: context.onSurface),
                  decoration: InputDecoration(
                    filled: false,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.onSurface.withOpacity(0.5),
                      ),
                    ),
                    hintText: 'Select Appointment Time',
                  ),
                  enabled: false,
                );
              },
              onClosed: onClosed,
              openBuilder: (_, __) => ScheduleView(
                previousDate: previousDate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
