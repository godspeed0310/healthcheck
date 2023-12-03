import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/details_view_model.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class DetailsView extends StatelessWidget {
  final MedicalTest test;
  final bool isPackage;
  final VoidCallback? onAddToCart;
  final ValueListenable cartListenable;

  const DetailsView({
    super.key,
    required this.test,
    this.isPackage = false,
    this.onAddToCart,
    required this.cartListenable,
  });

  @override
  Widget build(BuildContext context) {
    final Size illustrationSize = Size(75.w, 30.h);

    return ViewModelBuilder<DetailsViewModel>.reactive(
      viewModelBuilder: () => DetailsViewModel(),
      builder: (context, model, _) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              title: Text('${isPackage ? 'Package' : 'Test'} Details'),
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              children: [
                Builder(
                  builder: (_) {
                    if (context.isDarkEnabled) {
                      return Assets.illustrations.detailsIllustrationDark.svg(
                        height: illustrationSize.height,
                        width: illustrationSize.width,
                      );
                    } else {
                      return Assets.illustrations.detailsIllustrationLight.svg(
                        height: illustrationSize.height,
                        width: illustrationSize.width,
                      );
                    }
                  },
                ),
                Text(
                  test.name,
                  style: ktsHeader.copyWith(color: context.primaryColor),
                ),
                Gap(1.h),
                Builder(
                  builder: (_) {
                    if (test.discountedPrice != null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 3.w),
                            child: Text(
                              '₹${test.price}',
                              style: ktsHeader.copyWith(
                                fontSize: 10.sp,
                                color: context.primaryColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: context.primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            '₹${test.discountedPrice}',
                            style: ktsHeader.copyWith(
                              fontSize: 15.sp,
                              color: context.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Text(
                        '₹${test.price}',
                        style: ktsHeader.copyWith(
                          fontSize: 15.sp,
                          color: context.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  },
                ),
                Gap(1.h),
                Text(
                  test.description,
                ),
                Gap(1.h),
                ...List.generate(
                  test.tests.length,
                  (index) {
                    return Text(' • ${test.tests[index]}');
                  },
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 10.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Center(
                  child: ValueListenableBuilder(
                valueListenable: cartListenable,
                builder: (_, value, __) {
                  final bool inCart = value.values.contains(test);

                  return CTAButton(
                    label: inCart ? 'In cart' : 'Add to Cart',
                    color: inCart ? kcSecondary : context.primaryColor,
                    onPressed: () {
                      onAddToCart?.call();
                      model.refresh();
                    },
                    size: Size.fromHeight(6.4.h),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.5.sp,
                      color: kcWhite,
                    ),
                    borderRadius: BorderRadius.circular(2.6.w),
                  );
                },
              )),
            ),
          ),
        );
      },
    );
  }
}
