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
                  margin: EdgeInsets.symmetric(
                    horizontal: w * 0.05,
                    vertical: h * 0.02,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          materialItem.name,
                          style: TextStyle(
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: h * 0.02),

                        // Details
                        _buildRow(
                          "Consumption",
                          materialItem.consumption.toString(),
                        ),
                        SizedBox(height: h * 0.01),

                        _buildRow(
                          "Initial Stock",
                          materialItem.matinitstk.toString(),
                        ),
                        SizedBox(height: h * 0.01),

                        _buildRow(
                          "Threshold",
                          materialItem.thresold.toString(),
                        ),
                      ],
                    ),
                  ),
                ),

                // ✅ Delete Button
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

  // ✅ Reusable Row (Professional Look)
  Widget _buildRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        ),
        Expanded(flex: 3, child: Text(value)),
      ],
    );
  }
}
