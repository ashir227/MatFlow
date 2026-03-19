import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/themes.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;

  const CustomIcon({super.key, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      alignment: Alignment.center,
      child: Icon(icon, color: color ?? Appcolor.iconFlow, size: 32),
    );
  }
}
