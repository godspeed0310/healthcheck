import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/gen/assets.gen.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';

class DetailsViewDesktop extends StatelessWidget {
  final MedicalTest test;
  final bool isPackage;
  final VoidCallback? onAddToCart;
  final ValueListenable cartListenable;

  const DetailsViewDesktop({
    super.key,
    required this.test,
    required this.isPackage,
    this.onAddToCart,
    required this.cartListenable,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultSystemOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${isPackage ? 'Package' : 'Test'} Details'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Builder(
                  builder: (_) {
                    if (context.isDarkEnabled) {
                      return Assets.illustrations.detailsIllustrationDark.svg(
                        height: 200,
                      );
                    } else {
                      return Assets.illustrations.detailsIllustrationLight.svg(
                        height: 200,
                      );
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    test.name,
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor,
                    ),
                  ),
                  const Gap(15),
                  Builder(
                    builder: (_) {
                      if (test.discountedPrice != null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                '₹${test.price}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: context.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: context.primaryColor,
                                ),
                              ),
                            ),
                            Text(
                              '₹${test.discountedPrice}', // )
                              style: TextStyle(
                                fontSize: 40,
                                color: context.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text(
                          '₹${test.price}',
                          style: TextStyle(
                            fontSize: 40,
                            color: context.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    },
                  ),
                  const Gap(15),
                  Text(
                    test.description,
                  ),
                  const Gap(15),
                  ...List.generate(
                    test.tests.length,
                    (index) {
                      return Text(' • ${test.tests[index]}');
                    },
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: cartListenable,
                        builder: (_, value, __) {
                          final bool inCart = value.values.contains(test);

                          return CTAButton(
                            label: inCart ? 'In cart' : 'Add to Cart',
                            color: inCart ? kcSecondary : context.primaryColor,
                            onPressed: () {
                              onAddToCart?.call();
                            },
                            size: const Size.fromHeight(50),
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: kcWhite,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
