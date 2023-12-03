import 'package:flutter/material.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/widgets/cart_amount_card.dart';
import 'package:sizer/sizer.dart';

class CartPricingCard extends StatelessWidget {
  final int price;
  final int discountedPrice;

  const CartPricingCard(
      {super.key, required this.price, required this.discountedPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21.h,
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.onSurface.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(2.1.w),
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
              fontSize: 11.25.sp,
              color: context.primaryColor,
            ),
            amountStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.25.sp,
              color: context.primaryColor,
            ),
          ),
          const Spacer(),
          CartAmountCard(
            title: 'Total Savings',
            amount: discountedPrice,
            amountStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.25.sp,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
