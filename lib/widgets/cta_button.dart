import 'package:flutter/material.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:sizer/sizer.dart';

enum CTAButtonType {
  solid,
  outlined,
}

class CTAButton extends StatelessWidget {
  final String label;
  final CTAButtonType type;
  final Size? size;
  final VoidCallback? onPressed;
  final TextStyle? labelStyle;
  final BorderRadius? borderRadius;
  final bool enabled;
  final Color? color;

  const CTAButton({
    super.key,
    required this.label,
    this.type = CTAButtonType.solid,
    this.size,
    this.onPressed,
    this.labelStyle,
    this.borderRadius,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOutlined = type == CTAButtonType.outlined;
    final TextStyle defaultStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: isOutlined ? context.primaryColor : kcWhite,
      fontSize: 6.75.sp,
    );
    final Color primary =
        enabled ? color ?? context.primaryColor : Colors.grey[500]!;

    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: borderRadius ?? BorderRadius.circular(1.3.w),
      child: Ink(
        height: size?.height ?? 4.h,
        width: size?.width,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(1.3.w),
          color: isOutlined ? context.scaffoldBackgroundColor : primary,
          border: isOutlined ? Border.all(color: primary) : null,
        ),
        child: Center(
          child: Text(
            label,
            style: labelStyle ?? defaultStyle,
          ),
        ),
      ),
    );
  }
}
