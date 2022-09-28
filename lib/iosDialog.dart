import 'package:flutter/cupertino.dart';

class IOSDialog extends StatelessWidget {
  const IOSDialog({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Icon(
        icon,
        size: 100.0,
      ),
      content: Text(message),
    );
  }
}
