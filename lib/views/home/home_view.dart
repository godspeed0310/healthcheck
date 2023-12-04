import 'package:flutter/material.dart';
import 'package:healthcheck/views/home/home_view.desktop.dart';
import 'package:healthcheck/views/home/home_view.mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const HomeViewMobile(),
      desktop: (_) => const HomeViewDesktop(),
    );
  }
}
