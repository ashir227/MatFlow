import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/icon.dart';
import 'package:matflow/Core/theme/colors.dart';

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

class AddMTextfield extends StatelessWidget {
  final String label;
  const AddMTextfield({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 22),
        Text(
          textAlign: TextAlign.left,
          "Material Name",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        TextFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: Appcolor.focusedBorder, width: 1.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(),
            ),

            labelText: label,
          ),
        ),
      ],
    );
  }
}
