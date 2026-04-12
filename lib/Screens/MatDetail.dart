import 'package:flutter/material.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class Matdetails extends StatelessWidget {
  final Materialitem materialItem;

  const Matdetails({super.key, required this.materialItem});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Material Details")),
      body: Consumer<AddmatProvider>(
        builder: (context, pro, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // ✅ Detail Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                    horizontal: w * 0.05,
                    vertical: h * 0.02,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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

                        _item("Max Producible Pieces", "1000", w),
                      ],
                    ),
                  ),
                ),

                // Delete Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AddmatProvider>().deletematerial(
                          materialItem,
                        );
                        Navigator.pop(context);
                      },
                      child: Text("Delete"),
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
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: w * 0.05, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(thickness: 1);
  }
}
