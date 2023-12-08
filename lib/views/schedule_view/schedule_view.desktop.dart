import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/viewmodels/schedule_view_model.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:stacked/stacked.dart';

class ScheduleViewDesktop extends StatelessWidget {
  final DateTime? previousDate;

  const ScheduleViewDesktop({super.key, this.previousDate});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      onViewModelReady: (model) => model.initializeModel(previousDate),
      builder: (_, model, __) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Book Appointment'),
              surfaceTintColor: context.scaffoldBackgroundColor,
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 400,
                      child: CalendarDatePicker(
                        initialDate: previousDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(90.d),
                        onDateChanged: (date) => model.setSelectedDate(date),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 350,
                        child: GridView.builder(
                          itemCount: model.timeslots.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final TimeOfDay time = model.timeslots[index];
                            final String formattedTime =
                                time.customFormat(context);

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
                      ),
                      const Spacer(),
                      CTAButton(
                        label: 'Confirm',
                        onPressed:
                            model.isValid ? () => model.onSubmit() : null,
                        size: const Size(450, 50),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: kcWhite,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
