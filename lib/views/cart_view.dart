import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/viewmodels/cart_view_model.dart';
import 'package:healthcheck/views/schedule_view.dart';
import 'package:healthcheck/widgets/cart_amount_component.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/custom_open_container.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:healthcheck/widgets/section_header.dart';
import 'package:healthcheck/widgets/stadium_border_button.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, model, _) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('My Cart'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: kcSecondary,
                  ),
                ),
              ],
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              children: [
                const SectionHeader(title: 'Order Review'),
                Gap(4.h),
                Container(
                  height: 26.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.onSurface.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(2.1.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 5.5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.1.w),
                            topRight: Radius.circular(2.1.w),
                          ),
                          color: context.primaryColor.withOpacity(0.8),
                        ),
                        child: Center(
                          child: Text(
                            'Pathology Tests',
                            style: TextStyle(
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.bold,
                              color: kcWhite,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 2.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Thyroid Profile',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.25.sp,
                                    ),
                                  ),
                                  Text(
                                    '₹1000',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: context.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              StadiumBorderButton(
                                label: 'Remove',
                                icon: Icons.delete_outline,
                                onTap: () {},
                              ),
                              Gap(1.1.h),
                              StadiumBorderButton(
                                label: 'Upload Prescription (Optional)',
                                icon: Icons.upload_outlined,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(2.h),
                Container(
                  height: 10.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.onSurface.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(1.6.w),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        Gap(3.w),
                        Expanded(
                          child: CustomOpenContainer(
                            closedBuilder: (_, __) {
                              return TextField(
                                controller: model.dateController,
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
                            onClosed: (dynamic dateTime) =>
                                model.updateDate(dateTime, context),
                            openBuilder: (_, __) => ScheduleView(
                              previousDate: model.selectedDateTime,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(2.h),
                Container(
                  height: 21.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.onSurface.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(2.1.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CartAmountComponent(
                        title: 'M.R.P Amount',
                        amount: 1000,
                      ),
                      const CartAmountComponent(title: 'Discount', amount: 400),
                      CartAmountComponent(
                        title: 'Total Amount',
                        amount: 600,
                        titleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.25.sp,
                          color: context.primaryColor,
                        ),
                        amountStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.25.sp,
                          color: context.primaryColor,
                        ),
                      ),
                      const Spacer(),
                      CartAmountComponent(
                        title: 'Total Savings',
                        amount: 400,
                        amountStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.25.sp,
                          color: context.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(2.h),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.onSurface.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(2.1.w),
                  ),
                  child: CheckboxListTile(
                    value: model.conditionsAccepted,
                    onChanged: (bool? value) =>
                        model.setConditionStatus(value!),
                    title: Text(
                      'Hard copy of reports',
                      style: GoogleFonts.inter(
                        fontSize: 9.sp,
                        color: context.onSurface.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.\n\n₹150 per person',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: context.onSurface.withOpacity(0.5),
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 10.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Center(
                child: CTAButton(
                  onPressed:
                      model.isValid ? () => model.completeTransaction() : null,
                  enabled: model.isValid,
                  size: Size.fromHeight(6.4.h),
                  label: 'Schedule',
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
