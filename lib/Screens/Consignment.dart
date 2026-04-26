import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/material_consig.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addconsignment.dart';
import 'package:provider/provider.dart';

class Consignment extends StatelessWidget {
  Consignment({super.key});
  TextEditingController Unitcontrol = TextEditingController();
  TextEditingController Qtycontrol = TextEditingController();
  Materialitem? selecteditem;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                key: _formkey,
                children: [
                  SizedBox(height: h * 0.044),
                  DropDown(),
                  SizedBox(height: h * 0.04),

                  AddMTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {}
                    },
                    controller: Qtycontrol,
                    txt: "Consignment QTY",
                    errorText: "errorText",
                  ),
                  SizedBox(height: h * 0.43),
                  CustomButton.elevatedB(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ConsigModel newconsig = ConsigModel(
                          Unit: Unitcontrol.text,
                          Qty: int.parse(Qtycontrol.text),
                        );
                        Unitcontrol.clear();
                        Qtycontrol.clear();
                      }
                      //  context.read<ConsigProvider>().addconsig(newconsig)
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
