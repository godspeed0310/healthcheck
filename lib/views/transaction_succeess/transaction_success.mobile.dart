import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/viewmodels/transaction_success_view_model.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class TransactionSuccessViewMobile extends StatelessWidget {
  final Appointment appointment;

  const TransactionSuccessViewMobile({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedDateTime =
        DateFormat('d MMM y | h a').format(appointment.scheduledDate);

    return ViewModelBuilder<TransactionSuccessViewModel>.nonReactive(
      viewModelBuilder: () => TransactionSuccessViewModel(),
      onViewModelReady: (model) => model.initializeModel(appointment),
      builder: (context, model, child) {
        return PopScope(
          onPopInvoked: (_) => model.back(),
          child: DefaultSystemOverlay(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text(
                  'Transaction Successful',
                ),
                surfaceTintColor: context.scaffoldBackgroundColor,
              ),
              body: Center(
                child: Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.onSurface.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(2.6.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.illustrations.transactionSuccessfulIllustration
                          .svg(
                        width: 50.w,
                        height: 20.h,
                        colorFilter: ColorFilter.mode(
                          context.primaryColor,
                          BlendMode.srcATop,
                        ),
                      ),
                      Gap(5.h),
                      SizedBox(
                        width: 76.w,
                        child: Text(
                          'Lab tests have been scheduled successfully, You will receive a mail of the same.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.5.sp,
                          ),
                        ),
                      ),
                      Gap(2.h),
                      Text(
                        formattedDateTime,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: context.onSurface.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 10.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Center(
                  child: CTAButton(
                    onPressed: () => model.back(),
                    size: Size.fromHeight(6.4.h),
                    label: 'Back to home',
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
          ),
        );
      },
    );
  }
}
