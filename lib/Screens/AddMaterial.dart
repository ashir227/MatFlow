import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';

class AddMaterial extends StatelessWidget {
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
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      AddMTextfield(txt: "Material Name"),
                      SizedBox(height: 25),
                      DropDown(),
                      SizedBox(height: 25),
                      AddMTextfield(txt: "Per Piece Consumption"),
                      SizedBox(height: 25),
                      AddMTextfield(txt: "Initial Stock"),
                      SizedBox(height: 25),
                      AddMTextfield(txt: "Minimum Thresold"),
                      SizedBox(height: 30),
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
