import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/uiAssistance.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 130.0,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(26.5),
          child: Container(
            height: 77.0,
            width: 77.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.black12,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 8),
                  blurRadius: 6,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset('images/restaurant.png'),
            ),
          ),
        ),
        Positioned.fill(
          top: 25.0,
          left: 140.0,
          child: Text(
            'Artisan',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Positioned.fill(
          top: 67.0,
          left: 140.0,
          child: Text(
            'Healthy Food, Sandwich',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Positioned.fill(
          top: 55.0,
          left: 140.0,
          child: Row(
            children: [
              Text(
                'Koregaon Park, Pune',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              UIAssistance.horizontalSpaceSmall(),
              const Icon(
                CupertinoIcons.arrow_down_right_square_fill,
                size: 16.0,
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 55.0,
          left: 300.0,
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.time_solid,
                size: 16.0,
              ),
              UIAssistance.horizontalSpaceSmall(),
              Text(
                '21 min',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
