import 'package:flutter/material.dart';

class AndroidDialog extends StatelessWidget {
  const AndroidDialog({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: AlertDialog(
        title: Icon(
          icon,
          size: 100.0,
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
