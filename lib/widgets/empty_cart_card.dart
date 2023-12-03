import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:sizer/sizer.dart';

class EmptyCartCard extends StatelessWidget {
  const EmptyCartCard({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
