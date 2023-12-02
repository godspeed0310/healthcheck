import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:sizer/sizer.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? action;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.action,
    this.icon = Icons.arrow_forward,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: ktsHeader.copyWith(color: context.primaryColor),
          ),
          Visibility(
            visible: action != null,
            child: RichText(
              text: TextSpan(
                text: action,
                style: GoogleFonts.inter(
                  fontSize: 8.25.sp,
                  fontWeight: FontWeight.w500,
                  color: context.primaryColor,
                ),
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.13.w),
                      child: Icon(
                        icon,
                        size: 8.25.sp,
                        color: context.primaryColor,
                      ),
                    ),
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
