import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ratingStar.dart';
import 'package:untitled/uiAssistance.dart';

class BestsellerCard extends StatelessWidget {
  final bool visibility;
  final String itemName;
  final String id;
  final int price;
  final int reviews;
  final IconData iconData;
  final Widget addButton;

  const BestsellerCard({
    Key? key,
    required this.itemName,
    required this.price,
    required this.reviews,
    required this.visibility,
    required this.iconData,
    required this.addButton,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: visibility,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.arrow_up_square_fill,
                    color: Colors.redAccent,
                  ),
                  Chip(
                    label: const Text('Bestseller'),
                    backgroundColor: Colors.white,
                    deleteIconColor: Theme.of(context).errorColor,
                    onDeleted: null,
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    // shape: OutlinedBorder(side: BorderSide()),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              itemName,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 19.0,
                  ),
            ),
            subtitle: Text(
              "\u{20B9}$price",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: addButton,
            // tileColor: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                RatingStar(
                  iconData: iconData,
                ),
                RatingStar(
                  iconData: iconData,
                ),
                RatingStar(
                  iconData: iconData,
                ),
                RatingStar(
                  iconData: iconData,
                ),
                RatingStar(
                  iconData: iconData,
                ),
                UIAssistance.horizontalSpaceExtraSmall(),
                Text(
                  '$reviews reviews',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          UIAssistance.verticalSpaceSmall(),
        ],
      ),
    );
  }
}
