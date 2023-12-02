import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/widgets/stadium_border_button.dart';
import 'package:sizer/sizer.dart';

class CartOrderCard extends StatelessWidget {
  final MedicalTest test;

  const CartOrderCard({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        test.name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 11.25.sp,
                        ),
                      ),
                      Text(
                        '₹${test.price}',
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
    );
  }
}
