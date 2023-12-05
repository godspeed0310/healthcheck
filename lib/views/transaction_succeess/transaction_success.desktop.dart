import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/viewmodels/transaction_success_view_model.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class TransactionSuccessViewDesktop extends StatelessWidget {
  final Appointment appointment;

  const TransactionSuccessViewDesktop({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final String formattedDateTime =
        DateFormat('d MMM y | h a').format(appointment.scheduledDate);

    return ViewModelBuilder<TransactionSuccessViewModel>.nonReactive(
      viewModelBuilder: () => TransactionSuccessViewModel(),
      builder: (_, model, __) {
        return PopScope(
          canPop: false,
          child: DefaultSystemOverlay(
            child: Scaffold(
              body: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 1176,
                      height: 482,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: context.onSurface.withOpacity(0.5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Assets.illustrations.transactionSuccessfulIllustration
                              .svg(
                            width: 254,
                            height: 232,
                            colorFilter: ColorFilter.mode(
                              context.primaryColor,
                              BlendMode.srcATop,
                            ),
                          ),
                          const Gap(25),
                          const Text(
                            'Lab tests have been scheduled successfully, You\nwill receive a mail of the same.',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const Gap(47),
                          Text(
                            formattedDateTime,
                            style: TextStyle(
                              fontSize: 20,
                              color: context.onSurface.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 1176,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () => model.back(),
                          child: Text(
                            'Back to home',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: context.onSurface,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
