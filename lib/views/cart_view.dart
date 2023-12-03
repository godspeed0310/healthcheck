import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/cart_view_model.dart';
import 'package:healthcheck/views/schedule_view.dart';
import 'package:healthcheck/widgets/cart_amount_component.dart';
import 'package:healthcheck/widgets/cart_order_card.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/custom_open_container.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
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
                Visibility(
                  visible: model.tests.isNotEmpty,
                  child: IconButton(
                    onPressed: () => model.clearCart(context),
                    icon: const Icon(Icons.delete_outline),
                  ),
                ),
              ],
            ),
            body: Builder(
              builder: (_) {
                if (model.tests.isEmpty) {
                  return SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Assets.illustrations.emptyCartIllustration.svg(
                          height: 40.w,
                          width: 40.w,
                          colorFilter: ColorFilter.mode(
                            context.primaryColor,
                            BlendMode.srcATop,
                          ),
                        ),
                        Gap(2.h),
                        Text(
                          'Your cart is empty',
                          style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(1.h),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            'Add tests to your cart to schedule an appointment',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: context.onSurface.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final MedicalTest test = model.tests[index];
                          return CartOrderCard(
                            test: test,
                            onRemove: () => model.removeFromCart(test),
                            onUpload: () => model.uploadPrescription(),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return Gap(2.h);
                        },
                        itemCount: model.tests.length,
                        shrinkWrap: true,
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
                                      style:
                                          TextStyle(color: context.onSurface),
                                      decoration: InputDecoration(
                                        filled: false,
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: context.onSurface
                                                .withOpacity(0.5),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 2.h),
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
                            CartAmountComponent(
                              title: 'M.R.P Amount',
                              amount: model.totalAmount(),
                            ),
                            CartAmountComponent(
                              title: 'Discount',
                              amount: model.discountedPrice(),
                            ),
                            CartAmountComponent(
                              title: 'Total Amount',
                              amount:
                                  model.totalAmount() - model.discountedPrice(),
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
                              amount: model.discountedPrice(),
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
                  );
                }
              },
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
