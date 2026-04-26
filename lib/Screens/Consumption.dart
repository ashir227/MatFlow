import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/mateial_Con.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addconsumption.dart';
import 'package:provider/provider.dart';

class ConsMat extends StatelessWidget {
  ConsMat({super.key});
  TextEditingController Unitscontroller = TextEditingController();
  TextEditingController Qtycontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Appcolor.allbckgrnd,
        appBar: AppBar(
          centerTitle: true,
          title: Titletext(txt: "Add Consumption"),
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
          backgroundColor: Appcolor.Mat,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: w * 0.07),
            child: Column(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.044),
                      DropDown(),
                      SizedBox(height: h * 0.04),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {}
                        },
                        controller: Qtycontroller,
                        txt: "Production QTY",
                        errorText: "errorText",
                      ),
                      SizedBox(height: h * 0.43),
                      CustomButton.elevatedB(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ConModel newcons = ConModel(
                              Unit: Unitscontroller.text,
                              Qty: int.parse(Qtycontroller.text),
                            );
                            context.read<Consumeprovider>().addconsumption(
                              newcons,
                            );
                            Qtycontroller.clear();
                            Unitscontroller.clear();
                          }
                        },
                        Bcolor: Appcolor.Flow,
                        text: "Start",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
