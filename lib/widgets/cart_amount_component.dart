import 'package:flutter/material.dart';

class CartAmountComponent extends StatelessWidget {
  final String title;
  final int amount;
  final TextStyle? titleStyle;
  final TextStyle? amountStyle;

  const CartAmountComponent({
    super.key,
    required this.title,
    required this.amount,
    this.titleStyle,
    this.amountStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: titleStyle),
        Text('₹$amount', style: amountStyle),
      ],
    );
  }
}
