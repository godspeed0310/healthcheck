import 'package:flutter/material.dart';
import 'package:healthcheck/views/cart_view/cart_view.desktop.dart';
import 'package:healthcheck/views/cart_view/cart_view.mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const CartViewMobile(),
      desktop: (_) => const CartViewDesktop(),
    );
  }
}
