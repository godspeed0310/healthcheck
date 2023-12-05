import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/cart_view_model.dart';
import 'package:healthcheck/widgets/cart_calendar_card.dart';
import 'package:healthcheck/widgets/cart_conditions_card.dart';
import 'package:healthcheck/widgets/cart_order_card.dart';
import 'package:healthcheck/widgets/cart_pricing_card.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:healthcheck/widgets/unbounded_list_view.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class CartViewDesktop extends StatelessWidget {
  const CartViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (_, model, __) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('My Cart'),
            ),
            body: ValueListenableBuilder(
              valueListenable: model.cartListenable,
              builder: (_, value, __) {
                if (value.values.length == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Assets.illustrations.emptyCartIllustration.svg(
                            height: 250,
                            colorFilter: ColorFilter.mode(
                              context.primaryColor,
                              BlendMode.srcATop,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Your cart is empty',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: context.onSurface.withOpacity(0.8),
                              ),
                            ),
                            const Gap(20),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Add tests to your cart to schedule an appointment.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: context.onSurface.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UnboundedListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          final MedicalTest test = value.values.toList()[index];

                          return CartOrderCard(
                            test: test,
                            onRemove: () => model.removeFromCart(test),
                            onUpload: () => model.uploadPrescription(),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const Gap(20);
                        },
                        itemCount: value.values.length,
                      ),
                      const Gap(20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CartCalendarCard(
                            dateController: model.dateController,
                            onClosed: (dynamic dateTime) =>
                                model.updateDate(dateTime, context),
                            previousDate: model.selectedDateTime,
                          ),
                          Gap(!kIsMobile ? 20 : 2.h),
                          CartPricingCard(
                            price: model.totalAmount(),
                            discountedPrice: model.discountedPrice(),
                          ),
                          Gap(!kIsMobile ? 20 : 2.h),
                          CartConditionsCard(
                            isChecked: model.conditionsAccepted,
                            onChanged: (bool? value) =>
                                model.setConditionStatus(value!),
                          ),
                          Gap(!kIsMobile ? 20 : 2.h),
                          CTAButton(
                            label: 'Schedule',
                            onPressed: model.isValid
                                ? () => model.completeTransaction()
                                : null,
                            enabled: model.isValid,
                            size: const Size(450, 50),
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: kcWhite,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
