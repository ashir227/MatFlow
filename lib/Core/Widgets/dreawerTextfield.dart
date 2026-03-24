import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/icon.dart';

class DrawTextField extends StatelessWidget {
  String text;
  Icon? icon;
  VoidCallbackAction? callback;
  DrawTextField({
    super.key,
    required this.icon,
    required this.text,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text, style: TextStyle(fontSize: 18)),
      onTap: () {
        callback;
      },
    );
  }
}
