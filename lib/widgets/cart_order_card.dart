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
  final VoidCallback? onRemove;
  final VoidCallback? onUpload;

  const CartOrderCard({
    super.key,
    required this.test,
    this.onRemove,
    this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: !kIsMobile ? 686 : 90.w,
      padding: EdgeInsets.only(
        bottom: !kIsMobile ? 40 : 1.3.h,
        top: 0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.onSurface.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(!kIsMobile ? 10 : 2.1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: !kIsMobile ? 40 : 0,
            ),
            height: !kIsMobile ? 64 : 5.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(!kIsMobile ? 10 : 2.1.w),
                topRight: Radius.circular(!kIsMobile ? 10 : 2.1.w),
              ),
              color: context.primaryColor.withOpacity(0.8),
            ),
            child: Align(
              alignment: !kIsMobile ? Alignment.centerLeft : Alignment.center,
              child: Text(
                'Pathology Tests',
                style: TextStyle(
                  fontSize: !kIsMobile ? 20 : 10.5.sp,
                  fontWeight: FontWeight.bold,
                  color: kcWhite,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: !kIsMobile ? 32 : 5.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      test.name,
                      style: GoogleFonts.inter(
                        fontWeight:
                            !kIsMobile ? FontWeight.normal : FontWeight.w600,
                        fontSize: !kIsMobile ? 20 : 11.25.sp,
                      ),
                    ),
                    Text(
                      '₹${test.price}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: !kIsMobile ? 24 : 12.sp,
                        color: context.primaryColor,
                      ),
                    ),
                  ],
                ),
                Gap(5.h),
                Builder(
                  builder: (_) {
                    if (!kIsMobile) {
                      return Row(
                        children: [
                          StadiumBorderButton(
                            label: 'Remove',
                            icon: Icons.delete_outline,
                            onTap: onRemove,
                          ),
                          Gap(1.1.h),
                          StadiumBorderButton(
                            label: 'Upload Prescription (Optional)',
                            icon: Icons.upload_outlined,
                            onTap: onUpload,
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StadiumBorderButton(
                            label: 'Remove',
                            icon: Icons.delete_outline,
                            onTap: onRemove,
                          ),
                          Gap(1.1.h),
                          StadiumBorderButton(
                            label: 'Upload Prescription (Optional)',
                            icon: Icons.upload_outlined,
                            onTap: onUpload,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
