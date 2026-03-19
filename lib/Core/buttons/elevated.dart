import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/themes.dart';

class CustomButton {
  static Widget elevatedB({
    required VoidCallback onPressed,

    required Color? Bcolor,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 125, vertical: 11),

        backgroundColor: Bcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(9),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,

          color: Appcolor.border,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;

  const CustomIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      child: Icon(icon, color: Appcolor.iconFlow, size: 32),
    );
  }
}
