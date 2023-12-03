import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:sizer/sizer.dart';

class PackageCard extends StatelessWidget {
  final MedicalTest package;
  final bool inCart;
  final VoidCallback ctaAction;

  const PackageCard({
    super.key,
    required this.package,
    this.inCart = false,
    required this.ctaAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      width: 75.w,
      padding: EdgeInsets.all(5.w),
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
          CircleAvatar(
            radius: 8.w,
            backgroundColor: kcAltPrimary.withOpacity(0.1),
            child: Icon(
              Icons.medication,
              size: 8.w,
              color: context.primaryColor,
            ),
          ),
          Gap(2.2.h),
          Text(
            package.name,
            style: GoogleFonts.inter(
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(1.h),
          Text(
            'Includes ${package.tests.length} tests',
            style: TextStyle(
              fontSize: 7.8.sp,
              color: context.onSurface.withOpacity(0.5),
            ),
          ),
          ...List.generate(
            2,
            (index) {
              return Text(
                ' • ${package.tests[index]}',
                style: TextStyle(
                  fontSize: 7.8.sp,
                  color: context.onSurface.withOpacity(0.5),
                ),
              );
            },
          ),
          Text(
            'View more',
            style: TextStyle(
              fontSize: 7.8.sp,
              color: context.onSurface.withOpacity(0.5),
              decoration: TextDecoration.underline,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '₹${package.price}/-',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5.sp,
                  color: kcSecondary,
                ),
              ),
              CTAButton(
                onPressed: ctaAction,
                color: inCart ? kcSecondary : context.primaryColor,
                label: inCart ? 'In cart' : 'Add to Cart',
                size: Size(30.w, 4.h),
                type: CTAButtonType.outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
