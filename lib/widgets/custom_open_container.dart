import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CustomOpenContainer extends StatelessWidget {
  final Widget Function(BuildContext, void Function()) closedBuilder;
  final Widget Function(BuildContext, void Function({Object? returnValue}))
      openBuilder;
  final void Function(Object?)? onClosed;

  const CustomOpenContainer({
    super.key,
    required this.closedBuilder,
    required this.openBuilder,
    this.onClosed,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      middleColor: Colors.transparent,
      openElevation: 0,
      transitionType: ContainerTransitionType.fadeThrough,
      closedElevation: 0,
      closedBuilder: closedBuilder,
      openBuilder: openBuilder,
      onClosed: onClosed,
    );
  }
}
