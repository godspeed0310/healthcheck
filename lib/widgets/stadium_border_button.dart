import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:sizer/sizer.dart';

class StadiumBorderButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double? iconPadding;
  final Widget? action;
  final double? height;

  const StadiumBorderButton({
    super.key,
    this.icon,
    required this.label,
    this.onTap,
    this.padding,
    this.iconPadding,
    this.action,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final Color primary = context.primaryColor;
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.w),
      child: Ink(
        height: height,
        padding: padding ??
            EdgeInsets.symmetric(
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
                padding: EdgeInsets.only(
                  right: !kIsMobile ? iconPadding ?? 0 : 3.5.w,
                ),
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
            Visibility(
              visible: icon != null,
              child: Padding(
                padding: EdgeInsets.only(
                  left: !kIsMobile ? iconPadding ?? 0 : 3.5.w,
                ),
                child: action,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
