import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/icon.dart';
import 'package:matflow/Core/theme/colors.dart';

class DrawTextField extends StatelessWidget {
  final String text;
  final Icon? icon;
  final VoidCallback? onTap;

  const DrawTextField({
    super.key,

    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.grey[200],
      tileColor: Colors.white, // normal background

      hoverColor: const Color.fromARGB(233, 238, 238, 238),
      leading: icon,
      title: Text(text, style: const TextStyle(fontSize: 18)),
      onTap: onTap, // abhi bhi jo bhi function pass hua tha wo call hoga
    );
  }
}

class AddMTextfield extends StatelessWidget {
  final String txt;
  final TextEditingController controller;
  final validator;
  const AddMTextfield({
    super.key,
    required this.validator,
    required this.controller,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(left: 6, bottom: 4),
          child: Text(
            textAlign: TextAlign.left,
            txt,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: Appcolor.focusedBorder,
                  width: 1.5,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDown extends StatefulWidget {
  // final TextEditingController controller;
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<String> caterories = ["KG", "Pcs"];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    // String? textt;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(left: 6, bottom: 4),
          child: Text(
            textAlign: TextAlign.left,

            "Unit",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 50,
          child: DropdownButtonFormField(
            initialValue: caterories[0],
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(color: Appcolor.focusedBorder),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            items: caterories.map((item) {
              return DropdownMenuItem<String>(child: Text(item), value: item);
            }).toList(),
            onChanged: (value) {
              selectedCategory = value;
            },
          ),
        ),
      ],
    );
  }
}
