import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:sizer/sizer.dart';

class CartConditionsCard extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const CartConditionsCard({
    super.key,
    required this.isChecked,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(!kIsMobile ? 16 : 2.9.w),
      width: !kIsMobile ? 450 : 90.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.onSurface.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(!kIsMobile ? 5 : 2.1.w),
      ),
      child: CheckboxListTile(
        value: isChecked,
        onChanged: onChanged,
        title: Text(
          'Hard copy of reports',
          style: GoogleFonts.inter(
            fontSize: !kIsMobile ? 14 : 9.sp,
            color: context.onSurface.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.\n\n₹150 per person',
          style: TextStyle(
            fontSize: !kIsMobile ? 14 : 9.sp,
            color: context.onSurface.withOpacity(0.5),
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
