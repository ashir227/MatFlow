import 'package:flutter/material.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

Widget Dcard(BuildContext context) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;
  final matqty = context.watch<AddmatProvider>().material.length;
  return SizedBox(
    height: h * 0.16,
    child: Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Total Materials",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 142, 141, 141),
                  ),
                ),
                SizedBox(width: w * 0.04),
                Icon(Icons.tv, color: Colors.blue),
              ],
            ),
            Text(
              "$matqty ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ),
  );
}
