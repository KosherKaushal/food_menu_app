import 'package:flutter/material.dart';
import 'package:untitled/uiAssistance.dart';

class PreviousOrder extends StatelessWidget {
  final String name;
  final int price;
  final int quantity;

  const PreviousOrder(
      {Key? key,
      required this.name,
      required this.price,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      child: Column(
        children: [
          UIAssistance.verticalSpaceMedium(),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          UIAssistance.verticalSpaceSmall(),
          Text('\u{20B9}$price  x$quantity'),
          UIAssistance.verticalSpaceMedium(),
        ],
      ),
    );
  }
}
