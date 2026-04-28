import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/material_item.dart';

class MaterialDropDown extends StatelessWidget {
  final List<Materialitem> items;
  final Materialitem? selectedItem;
  final Function(Materialitem?) onChanged;

  const MaterialDropDown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Materialitem>(
      hint: const Text("Select Material"),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Appcolor.focusedBorder),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
      ),
      value: selectedItem,
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item.name));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
