import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';

class AddMaterial extends StatelessWidget {
  AddMaterial({super.key});
  final matnamecontroller = TextEditingController();
  final unitcontroller = TextEditingController();
  final consumpcontroller = TextEditingController();
  final initstkcontroller = TextEditingController();
  final minstkcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Appcolor.allbckgrnd,
        appBar: AppBar(
          centerTitle: true,
          title: Titletext(),
          toolbarHeight: 110,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
          backgroundColor: Appcolor.Mat,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name Required";
                          }
                        },
                        txt: "Material Name",
                        controller: matnamecontroller,
                      ),
                      SizedBox(height: 25),
                      DropDown(),
                      SizedBox(height: 25),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Consumption QTY Required";
                          }
                        },
                        txt: "Per Piece Consumption",
                        controller: consumpcontroller,
                      ),
                      SizedBox(height: 25),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Stock Required";
                          }
                        },
                        txt: "Initial Stock",
                        controller: initstkcontroller,
                      ),
                      SizedBox(height: 25),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name Minimum Stock Required";
                          }
                        },
                        txt: "Minimum Thresold",
                        controller: minstkcontroller,
                      ),
                      SizedBox(height: 37),
                      CustomButton.elevatedB(
                        onPressed: () {},
                        Bcolor: Appcolor.Elevbtnclr,
                        Padding: EdgeInsets.symmetric(
                          horizontal: 135,
                          vertical: 13,
                        ),
                        text: "Save",
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
