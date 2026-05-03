import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/Screens/MatDetail.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class MatlistScr extends StatelessWidget {
  const MatlistScr({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Titletext(txt: "Material Item"),
        toolbarHeight: h * 0.12,
        backgroundColor: Appcolor.Mat,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        child: Consumer<AddmatProvider>(
          builder: (context, pro, _) {
            return Column(
              children: [
                SizedBox(height: h * 0.01),

                /// HEADER
                Container(
                  padding: EdgeInsets.symmetric(vertical: h * 0.01),
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: Text("Material")),
                      Expanded(flex: 2, child: Text("Available")),
                      Expanded(flex: 2, child: Text("Status")),
                      Expanded(flex: 1, child: Text("")),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.01),

                /// LIST
                Expanded(
                  child: ListView.builder(
                    itemCount: pro.material.length,
                    itemBuilder: (context, index) {
                      final item = pro.material[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Matdetails(materialItem: item),
                            ),
                          );
                        },

                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: h * 0.008),
                          padding: EdgeInsets.symmetric(
                            vertical: h * 0.015,
                            horizontal: w * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(w * 0.02),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),

                          /// ROW (SAFE VERSION)
                          child: Row(
                            children: [
                              /// Material
                              Expanded(
                                flex: 4,
                                child: Text(
                                  item.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: w * 0.035,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              /// Available
                              Expanded(
                                flex: 2,
                                child: Text(
                                  item.matinitstk.toString(),
                                  style: TextStyle(fontSize: w * 0.035),
                                ),
                              ),

                              /// Status
                              Expanded(
                                flex: 2,
                                child: matStatus(item, w * 0.03),
                              ),

                              /// DELETE ONLY
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: w * 0.05,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<AddmatProvider>()
                                        .deletematerial(item);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// STATUS WIDGET
Widget matStatus(Materialitem item, double fontSize) {
  bool isLow = item.matinitstk < item.thresold;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(
      color: isLow ? Colors.red.shade100 : Colors.green.shade100,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      isLow ? "Low" : "OK",
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: isLow ? Colors.red : Colors.green,
      ),
    ),
  );
}
