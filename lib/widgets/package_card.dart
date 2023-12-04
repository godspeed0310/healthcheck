import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/views/details_view.dart';
import 'package:healthcheck/widgets/cta_button.dart';
import 'package:healthcheck/widgets/custom_open_container.dart';
import 'package:sizer/sizer.dart';

class PackageCard extends StatelessWidget {
  final MedicalTest package;
  final ValueListenable cartListenable;
  final VoidCallback ctaAction;
  final VoidCallback? onCardTap;

  const PackageCard({
    super.key,
    required this.package,
    required this.cartListenable,
    required this.ctaAction,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return CustomOpenContainer(
      closedBuilder: (_, __) {
        return Container(
          width: !kIsMobile ? 371 : 75.w,
          padding: EdgeInsets.all(!kIsMobile ? 32 : 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(!kIsMobile ? 8 : 1.3.w),
            border: Border.all(
              color: context.onSurface.withOpacity(0.5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: !kIsMobile ? 40 : 8.w,
                backgroundColor: kcAltPrimary.withOpacity(0.1),
                child: Icon(
                  Icons.medication,
                  size: !kIsMobile ? 40 : 8.w,
                  color: context.primaryColor,
                ),
              ),
              Gap(!kIsMobile ? 24 : 2.2.h),
              Text(
                package.name,
                maxLines: !kIsMobile ? 1 : 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: !kIsMobile ? 24 : 13.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(1.h),
              Text(
                'Includes ${package.tests.length} tests',
                style: TextStyle(
                  fontSize: !kIsMobile ? 14 : 7.8.sp,
                  color: context.onSurface.withOpacity(0.5),
                ),
              ),
              ...List.generate(
                2,
                (index) {
                  return Text(
                    ' • ${package.tests[index]}',
                    style: TextStyle(
                      fontSize: !kIsMobile ? 14 : 7.8.sp,
                      color: context.onSurface.withOpacity(0.5),
                    ),
                  );
                },
              ),
              Text(
                'View more ${(kIsMobile)}',
                style: TextStyle(
                  fontSize: !kIsMobile ? 14 : 7.8.sp,
                  color: context.onSurface.withOpacity(0.5),
                  decoration: TextDecoration.underline,
                ),
              ),
              !kIsMobile ? const Gap(10) : Gap(3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(
                    builder: (_) {
                      if (package.discountedPrice != null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '₹${package.price}/-',
                              style: TextStyle(
                                fontSize: !kIsMobile ? 12 : 7.sp,
                                color: kcSecondary,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: kcSecondary,
                              ),
                            ),
                            Gap(1.w),
                            Text(
                              '₹${package.discountedPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kcSecondary,
                                fontSize: !kIsMobile ? 24 : 13.5.sp,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text(
                          '₹${package.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: !kIsMobile ? 24 : 13.5.sp,
                            color: kcSecondary,
                          ),
                        );
                      }
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: cartListenable,
                    builder: (_, value, __) {
                      final inCart = value.values.contains(package);

                      return CTAButton(
                        onPressed: ctaAction,
                        color: inCart ? kcSecondary : context.primaryColor,
                        label: inCart ? 'In cart' : 'Add to Cart',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: inCart ? kcSecondary : context.primaryColor,
                          fontSize: !kIsMobile ? 16 : 6.75.sp,
                        ),
                        borderRadius:
                            BorderRadius.circular(!kIsMobile ? 4 : 1.3.w),
                        size: Size(
                            !kIsMobile ? 152 : 30.w, !kIsMobile ? 44 : 4.h),
                        type: CTAButtonType.outlined,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
      openBuilder: (_, __) {
        return DetailsView(
          test: package,
          cartListenable: cartListenable,
          isPackage: true,
          onAddToCart: ctaAction,
        );
      },
    );
  }
}
