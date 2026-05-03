import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/Widgets/iconButton.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class AddMaterial extends StatefulWidget {
  AddMaterial({super.key});

  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  final matnamecontroller = TextEditingController();

  // final unitcontroller = TextEditingController();
  final consumpcontroller = TextEditingController();

  final initstkcontroller = TextEditingController();

  final minstkcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? selectedUnit;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Appcolor.allbckgrnd,
        appBar: AppBar(
          centerTitle: true,
          title: Titletext(txt: "Add Material"),
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
          backgroundColor: Appcolor.Mat,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.044),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name Required";
                          }
                        },
                        txt: "Material Name",
                        controller: matnamecontroller,
                        errorText: '',
                      ),
                      SizedBox(height: h * 0.033),
                      DropDown(
                        onChanged: (value) {
                          setState(() {
                            selectedUnit = value;
                          });
                        },
                      ),
                      SizedBox(height: h * 0.033),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Consumption QTY Required";
                          }
                          double? numb = double.tryParse(value);
                          if (numb == null) {
                            return "Enter valid number";
                          }

                          if (numb < 0) {
                            return "Enter Prositive QTY";
                          }
                        },
                        txt: "Per Piece Consumption",
                        controller: consumpcontroller,
                        errorText: '',
                      ),
                      SizedBox(height: h * 0.033),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Stock Required";
                          }
                        },
                        txt: "Initial Stock",
                        controller: initstkcontroller,

                        errorText: '',
                      ),
                      SizedBox(height: h * 0.033),
                      AddMTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name Minimum Stock Required";
                          }
                        },
                        txt: "Minimum Thresold",
                        controller: minstkcontroller,
                        errorText: '',
                      ),
                      SizedBox(height: h * 0.05),
                      CustomButton.elevatedB(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Materialitem newmatitem = Materialitem(
                              name: matnamecontroller.text,
                              unit: selectedUnit!,
                              matinitstk: double.parse(initstkcontroller.text),
                              thresold: int.parse(minstkcontroller.text),
                              consumption: double.parse(consumpcontroller.text),
                            );

                            String? result = context
                                .read<AddmatProvider>()
                                .addmaterial(newmatitem);
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Appcolor.Flow,
                                  content: Text(
                                    "Material Added Sucessful",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                              matnamecontroller.clear();
                              consumpcontroller.clear();
                              initstkcontroller.clear();
                              minstkcontroller.clear();
                            }
                          }
                        },

                        Bcolor: Appcolor.Elevbtnclr,
                        Padding: EdgeInsets.symmetric(
                          horizontal: h * 0.16,
                          vertical: w * 0.035,
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
