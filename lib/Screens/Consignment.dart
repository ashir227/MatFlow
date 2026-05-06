import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/Widgets/addConsig_drop.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/material_consig.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class Consignment extends StatefulWidget {
  Consignment({super.key});

  @override
  State<Consignment> createState() => _ConsignmentState();
}

class _ConsignmentState extends State<Consignment> {
  // TextEditingController Unitcontrol = TextEditingController();

  TextEditingController Qtycontrol = TextEditingController();

  Materialitem? selecteditem;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pro = context.watch<AddmatProvider>();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Titletext(txt: "Add Consignment"),
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
          backgroundColor: Appcolor.Mat,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: w * 0.07),
            child: Form(
              key: _formkey,

              child: Column(
                children: [
                  SizedBox(height: h * 0.044),
                  MaterialDropDown(
                    items: pro.material,
                    selectedItem: selecteditem,
                    onChanged: (value) {
                      setState(() {
                        selecteditem = value;
                      });
                    },
                  ),
                  SizedBox(height: h * 0.04),

                  AddMTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Qty";
                      }
                      final qty = int.parse(Qtycontrol.text);
                      if (qty <= 0) {
                        return "Enter positive value";
                      }
                    },
                    controller: Qtycontrol,
                    txt: "Consignment QTY",
                    errorText: "errorText",
                  ),
                  SizedBox(height: h * 0.43),
                  CustomButton.elevatedB(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        if (selecteditem == null) {
                          print("Select material");
                          return;
                        }
                        int qty = int.parse(Qtycontrol.text);

                        context.read<AddmatProvider>().addconsign(
                          selecteditem!,
                          qty,
                        );
                        Qtycontrol.clear();
                        Navigator.pop(context);
                      }
                    },
                    Bcolor: Appcolor.Flow,
                    text: "Start",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
