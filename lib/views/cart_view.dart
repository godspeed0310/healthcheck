import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/cart_view_model.dart';
import 'package:healthcheck/widgets/cart_calendar_card.dart';
import 'package:healthcheck/widgets/cart_conditions_card.dart';
import 'package:healthcheck/widgets/cart_order_card.dart';
import 'package:healthcheck/widgets/cart_pricing_card.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:healthcheck/widgets/empty_cart_card.dart';
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
              surfaceTintColor: context.scaffoldBackgroundColor,
            ),
            body: Builder(
              builder: (_) {
                if (model.tests.isEmpty) {
                  return const EmptyCartCard();
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
                      CartCalendarCard(
                        dateController: model.dateController,
                        onClosed: (dynamic dateTime) =>
                            model.updateDate(dateTime, context),
                        previousDate: model.selectedDateTime,
                      ),
                      Gap(2.h),
                      CartPricingCard(
                        price: model.totalAmount(),
                        discountedPrice: model.discountedPrice(),
                      ),
                      Gap(2.h),
                      CartConditionsCard(
                        isChecked: model.conditionsAccepted,
                        onChanged: (bool? value) =>
                            model.setConditionStatus(value!),
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
