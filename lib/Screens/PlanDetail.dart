import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class MatPlanDetail extends StatelessWidget {
  final Materialitem materialItem;

  const MatPlanDetail({super.key, required this.materialItem});

  @override
  Widget build(BuildContext context) {
    var reqmater = context.watch<AddmatProvider>().reqmat();
    var prodcue = materialItem.consumption * materialItem.matinitstk;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // var units = context.watch<Materialitem>();
    return Scaffold(
      appBar: AppBar(title: Text("Material Plainning")),
      body: Consumer<AddmatProvider>(
        builder: (context, pro, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: Appcolor.Mat,
                  shadowColor: Appcolor.Mat,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                    horizontal: w * 0.05,
                    vertical: h * 0.06,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _item("Name", materialItem.name, w),
                        _divider(),

                        _item("Unit", materialItem.unit, w),
                        _divider(),
                        _item(
                          "Current Stock",
                          materialItem.matinitstk.toString(),
                          w,
                        ),
                        _divider(),

                        _item(
                          "Per Piece Consumption",
                          materialItem.consumption.toString(),
                          w,
                        ),
                        _divider(),

                        _item(
                          "Minimum Level",
                          materialItem.thresold.toString(),
                          w,
                        ),
                        _divider(),

                        _item("Max Producible Pieces", "$prodcue", w),

                        _divider(),
                        _item("Required Qty", "$reqmater", w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _item(String title, String value, double w) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: w * 0.035,
              color: const Color.fromARGB(255, 209, 207, 207),
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700,
              color: Appcolor.background,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(thickness: 1);
  }
}
