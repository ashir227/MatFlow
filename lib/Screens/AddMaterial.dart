import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';

class AddMaterial extends StatelessWidget {
  String? nameError;
  String? consmpError;
  String? intstkError;
  String? minstkError;

  AddMaterial({
    super.key,
    this.nameError,
    this.consmpError,
    this.intstkError,
    this.minstkError,
  });

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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: Appcolor.Mat,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
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
                    errorText: nameError,
                  ),
                  SizedBox(height: 25),
                  DropDown(),
                  SizedBox(height: 25),
                  AddMTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Consumption QTY Required";
                      }
                      int? numb = int.tryParse(value);
                      if (numb == null) {
                        return "Enter valid number";
                      }
                      if (numb < 0) {
                        return "Enter Positive QTY";
                      }
                    },
                    txt: "Per Piece Consumption",
                    controller: consumpcontroller,
                    errorText: consmpError,
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
                    errorText: intstkError,
                  ),
                  SizedBox(height: 25),
                  AddMTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Minimum Stock Required";
                      }
                    },
                    txt: "Minimum Threshold",
                    controller: minstkcontroller,
                    errorText: minstkError,
                  ),
                  SizedBox(height: 37),
                  CustomButton.elevatedB(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
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
          ),
        ),
      ),
    );
  }
}
