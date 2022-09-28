import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final IconData iconData;
  const RatingStar({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 14.0,
      color: Colors.orangeAccent,
    );
  }
}
