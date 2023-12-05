import 'package:flutter/material.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/widgets/cart_amount_card.dart';
import 'package:sizer/sizer.dart';

class CartPricingCard extends StatelessWidget {
  final int price;
  final int discountedPrice;

  const CartPricingCard({
    super.key,
    required this.price,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    final bool kIsMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: !kIsMobile ? 450 : 90.w,
      height: !kIsMobile ? 229 : 21.h,
      padding: EdgeInsets.symmetric(
        horizontal: !kIsMobile ? 42 : 5.w,
        vertical: !kIsMobile ? 26 : 2.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.onSurface.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(!kIsMobile ? 8 : 2.1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartAmountCard(
            title: 'M.R.P Amount',
            amount: price,
          ),
          CartAmountCard(
            title: 'Discount',
            amount: discountedPrice,
          ),
          CartAmountCard(
            title: 'Total Amount',
            amount: price - discountedPrice,
            titleStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: !kIsMobile ? 20 : 11.25.sp,
              color: context.primaryColor,
            ),
            amountStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: !kIsMobile ? 20 : 11.25.sp,
              color: context.primaryColor,
            ),
          ),
          const Spacer(),
          CartAmountCard(
            title: 'Total Savings',
            amount: discountedPrice,
            amountStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: !kIsMobile ? 20 : 11.25.sp,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
