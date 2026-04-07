import 'package:flutter/material.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class Matdetails extends StatelessWidget {
  final Materialitem materialItem; // Ye data screen ko milega
  const Matdetails({super.key, required this.materialItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AddmatProvider>(
        builder: (context, pro, index) {
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsetsDirectional.all(30),
                  child: Column(
                    children: [
                      Text(materialItem.name),
                      Text(materialItem.consumption.toString()),
                      Text(materialItem.matinitstk.toString()),
                      Text(materialItem.thresold.toString()),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
