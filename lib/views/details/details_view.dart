import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/views/details/details_view.desktop.dart';
import 'package:healthcheck/views/details/details_view.mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailsView extends StatelessWidget {
  final MedicalTest test;
  final bool isPackage;
  final VoidCallback? onAddToCart;
  final ValueListenable cartListenable;

  const DetailsView({
    super.key,
    required this.test,
    required this.isPackage,
    this.onAddToCart,
    required this.cartListenable,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => DetailsViewMobile(
        test: test,
        isPackage: isPackage,
        onAddToCart: onAddToCart,
        cartListenable: cartListenable,
      ),
      desktop: (_) => DetailsViewDesktop(
        test: test,
        isPackage: isPackage,
        onAddToCart: onAddToCart,
        cartListenable: cartListenable,
      ),
    );
  }
}
