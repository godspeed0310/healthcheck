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

  const LabTestCard({super.key, this.ctaAction, required this.medicalTest});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.3.w),
        border: Border.all(
          color: context.onSurface.withOpacity(0.5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1.3.w),
                topRight: Radius.circular(1.3.w),
              ),
              color: context.primaryColor.withOpacity(0.8),
            ),
            child: Center(
              child: Text(
                medicalTest.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 7.5.sp,
                  color: kcWhite,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(2.1.h),
                  Text(
                    'Includes ${medicalTest.tests.length} tests',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  Gap(1.7.h),
                  Text(
                    'Get reports in 24 hours',
                    style: TextStyle(
                      fontSize: 7.sp,
                    ),
                  ),
                  Text(
                    '₹${medicalTest.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  CTAButton(
                    label: 'Add to Cart',
                    onPressed: ctaAction,
                  ),
                  Gap(1.h),
                  const CTAButton(
                    label: 'View Details',
                    type: CTAButtonType.outlined,
                  ),
                  Gap(1.1.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
