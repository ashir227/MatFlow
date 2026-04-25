import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';

class Consignment extends StatelessWidget {
  Consignment({super.key});
  TextEditingController sell = TextEditingController();
  TextEditingController consi = TextEditingController();
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
            child: Column(
              children: [
                SizedBox(height: h * 0.044),
                DropDown(),
                SizedBox(height: h * 0.04),

                AddMTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {}
                  },
                  controller: sell,
                  txt: "Consignment QTY",
                  errorText: "errorText",
                ),
                SizedBox(height: h * 0.43),
                CustomButton.elevatedB(
                  onPressed: () {},
                  Bcolor: Appcolor.Flow,
                  text: "Start",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
