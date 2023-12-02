import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcheck/constants/app_extensions.dart';

class DefaultSystemOverlay extends StatelessWidget {
  final Widget child;

  const DefaultSystemOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: context.scaffoldBackgroundColor,
        statusBarIconBrightness: context.iconBrightness,
        systemNavigationBarColor: context.scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: context.iconBrightness,
      ),
      child: SafeArea(child: child),
    );
  }
}
