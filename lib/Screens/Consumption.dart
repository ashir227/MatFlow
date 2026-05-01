import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Core/Widgets/addConsig_drop.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/mateial_Con.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class ConsMat extends StatefulWidget {
  ConsMat({super.key});

  @override
  State<ConsMat> createState() => _ConsMatState();
}

class _ConsMatState extends State<ConsMat> {
  TextEditingController Unitscontroller = TextEditingController();

  TextEditingController Qtycontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Materialitem? selecteditem;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var pro = context.watch<AddmatProvider>();
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
                            return ("Enter valid Qty");
                          }
                          double? numm = double.tryParse(value);
                          if (numm! < 0) {
                            return ("Enter Positive value");
                          }
                        },
                        controller: Qtycontroller,
                        txt: "Production QTY",
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
                          }
                          double Pcs = double.parse(Qtycontroller.text);
                          context.read<AddmatProvider>().addconsume(
                            selecteditem!,
                            Pcs,
                          );
                          Qtycontroller.clear();
                          Navigator.pop(context);
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
