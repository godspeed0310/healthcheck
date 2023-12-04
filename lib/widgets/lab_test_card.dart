import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:sizer/sizer.dart';

class LabTestCard extends StatelessWidget {
  final VoidCallback? ctaAction;
  final MedicalTest medicalTest;
  final ValueListenable cartListenable;
  final VoidCallback? openDetails;

  const LabTestCard({
    super.key,
    this.ctaAction,
    required this.medicalTest,
    required this.cartListenable,
    this.openDetails,
  });

  @override
  Widget build(BuildContext context) {
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(!kIsMobile ? 10 : 1.3.w),
        border: Border.all(
          color: context.onSurface.withOpacity(0.5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: !kIsMobile ? 64 : 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(!kIsMobile ? 10 : 1.3.w),
                topRight: Radius.circular(!kIsMobile ? 10 : 1.3.w),
              ),
              color: context.primaryColor.withOpacity(0.8),
            ),
            child: Center(
              child: Text(
                medicalTest.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: !kIsMobile ? 20 : 7.sp,
                  color: kcWhite,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: !kIsMobile ? 29 : 3.2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(!kIsMobile ? 14 : 2.1.h),
                  Text(
                    'Includes ${medicalTest.tests.length} tests',
                    style: TextStyle(
                      fontSize: !kIsMobile ? 14 : 10.sp,
                    ),
                  ),
                  Gap(!kIsMobile ? 5 : 1.7.h),
                  Builder(
                    builder: (_) {
                      if (!kIsMobile) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            math.min(medicalTest.tests.length, 3),
                            (index) {
                              return Text(
                                ' • ${medicalTest.tests[index]}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Gap(0);
                      }
                    },
                  ),
                  Gap(!kIsMobile ? 27 : 0),
                  Text(
                    'Get reports in 24 hours',
                    style: TextStyle(
                      fontSize: !kIsMobile ? 14 : 7.sp,
                    ),
                  ),
                  Builder(
                    builder: (_) {
                      if (medicalTest.discountedPrice != null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '₹${medicalTest.price}',
                              style: TextStyle(
                                fontSize: !kIsMobile ? 13 : 7.sp,
                                color: context.primaryColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: context.primaryColor,
                              ),
                            ),
                            Gap(1.w),
                            Text(
                              '₹${medicalTest.discountedPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: !kIsMobile ? 20 : 7.5.sp,
                                color: context.primaryColor,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text(
                          '₹${medicalTest.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: !kIsMobile ? 20 : 7.5.sp,
                            color: context.primaryColor,
                          ),
                        );
                      }
                    },
                  ),
                  const Spacer(),
                  ValueListenableBuilder(
                    valueListenable: cartListenable,
                    builder: (context, value, _) {
                      final bool inCart = value.values.contains(medicalTest);

                      return CTAButton(
                        label: inCart ? 'In cart' : 'Add to Cart',
                        onPressed: ctaAction,
                        borderRadius: BorderRadius.circular(
                          !kIsMobile ? 10 : 1.3.w,
                        ),
                        size: Size(
                          !kIsMobile ? 310 : 40.w,
                          !kIsMobile ? 52 : 4.5.h,
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: !kIsMobile ? 16 : 7.sp,
                          color: kcWhite,
                        ),
                        color: inCart ? kcSecondary : context.primaryColor,
                      );
                    },
                  ),
                  Gap(1.h),
                  CTAButton(
                    onPressed: openDetails,
                    borderRadius: BorderRadius.circular(
                      !kIsMobile ? 10 : 1.3.w,
                    ),
                    label: 'View Details',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: !kIsMobile ? 16 : 7.sp,
                      color: context.primaryColor,
                    ),
                    size: Size(
                      !kIsMobile ? 310 : 40.w,
                      !kIsMobile ? 52 : 4.5.h,
                    ),
                    type: CTAButtonType.outlined,
                  ),
                  Gap(1.1.h),
                ],
              ),
            ),
          ),
          Gap(!kIsMobile ? 20 : 0),
        ],
      ),
    );
  }
}
