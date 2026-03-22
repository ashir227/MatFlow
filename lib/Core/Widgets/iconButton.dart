import 'package:flutter/material.dart';

class IconBut extends StatelessWidget {
  final String? text;
  final VoidCallbackAction;
  final icon;
  const IconBut({
    super.key,
    required this.icon,
    this.text,
    this.VoidCallbackAction,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        VoidCallbackAction;
      },
      icon: icon,
    );
  }
}
