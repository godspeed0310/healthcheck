import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/viewmodels/schedule_view_model.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:healthcheck/widgets/section_header.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class ScheduleViewMobile extends StatelessWidget {
  final DateTime? previousDate;

  const ScheduleViewMobile({super.key, this.previousDate});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      onViewModelReady: (model) => model.initializeModel(previousDate),
      builder: (context, model, _) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Book Appointment'),
              surfaceTintColor: context.scaffoldBackgroundColor,
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              children: [
                const SectionHeader(
                  title: 'Select Date',
                  padding: EdgeInsets.zero,
                ),
                Gap(1.h),
                CalendarDatePicker(
                  initialDate: previousDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(90.d),
                  onDateChanged: (date) => model.setSelectedDate(date),
                ),
                Gap(3.6.h),
                const SectionHeader(
                  title: 'Select Time',
                  padding: EdgeInsets.zero,
                ),
                Gap(2.h),
                GridView.builder(
                  itemCount: model.timeslots.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    mainAxisSpacing: 1.6.h,
                    crossAxisSpacing: 8.4.w,
                  ),
                  itemBuilder: (context, index) {
                    final TimeOfDay time = model.timeslots[index];
                    final String formattedTime = time.customFormat(context);

                    return ChoiceChip(
                      showCheckmark: false,
                      onSelected: model.isDateSelected
                          ? (_) => model.setSelectedTime(time)
                          : null,
                      selectedColor: context.primaryColor,
                      labelStyle: TextStyle(
                        color: model.selectedTime == time
                            ? kcWhite
                            : context.onSurface,
                      ),
                      selected: model.selectedTime == time,
                      label: Text(formattedTime),
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 10.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Center(
                child: CTAButton(
                  onPressed: model.isValid ? () => model.onSubmit() : null,
                  enabled: model.isValid,
                  size: Size.fromHeight(6.4.h),
                  label: 'Confirm',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.5.sp,
                    color: kcWhite,
                  ),
                  borderRadius: BorderRadius.circular(2.6.w),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
