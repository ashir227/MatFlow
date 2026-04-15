import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';

class ConsMat extends StatelessWidget {
  ConsMat({super.key});
  TextEditingController selmat = TextEditingController();
  TextEditingController Pieces = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: w * 0.07),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  AddMTextfield(
                    validator: (value) {
                      if (value == null && value < 0) {}
                    },
                    controller: selmat,
                    txt: "Select Material",
                    errorText: "h",
                  ),
                  SizedBox(height: h * 0.07),
                  DropDown(),

                  AddMTextfield(
                    validator: (value) {
                      if (value == null && value == value.isEmpty) {
                        return "Consumption QTY Required";
                      }
                      int? numm = int.tryParse(value);
                      if (numm == null) {
                        return "Enter valid No";
                      }
                      if (numm < 0) {
                        return "Enter Positive QTY";
                      }
                    },
                    controller: Pieces,
                    txt: "Enter Production",
                    errorText: "Error",
                  ),
                  SizedBox(height: h * 0.8),
                  CustomButton.elevatedB(
                    onPressed: () {},
                    Bcolor: Appcolor.Mat,
                    text: "ooooo",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
