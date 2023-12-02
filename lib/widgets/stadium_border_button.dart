import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:sizer/sizer.dart';

class StadiumBorderButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;

  const StadiumBorderButton(
      {super.key, this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color primary = context.primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.w),
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: 3.2.w,
          vertical: 0.6.h,
        ),
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(
              color: context.primaryColor,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Padding(
                padding: EdgeInsets.only(right: 3.5.w),
                child: Icon(
                  icon,
                  color: primary,
                ),
              ),
            ),
            Text(
              label,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                color: primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
