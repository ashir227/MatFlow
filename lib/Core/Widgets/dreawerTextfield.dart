import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/icon.dart';

class DrawTextField extends StatelessWidget {
  final String text;
  Icon? icon;
  final VoidCallback? onTap;
  DrawTextField({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: icon,
        title: Text(text, style: TextStyle(fontSize: 18)),
        onTap: onTap,
      ),
    );
  }
}
