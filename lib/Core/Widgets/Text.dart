import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';

class CustmText extends StatelessWidget {
  final String text;
  final colors;
  final double? size;
  final weight;
  const CustmText({required this.text, this.colors, this.size, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 14,
        color: colors ?? Appcolor.background,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
