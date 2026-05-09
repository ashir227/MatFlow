import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

Widget QuickAct(
  // SizedBox sizex,
  BuildContext context,
  String txt,
  IconData icon,
  Color iconColor,
) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;
  final matqty = context.watch<AddmatProvider>().material.length;
  final unitcnt = context.watch<AddmatProvider>().unitcount;
  return SizedBox(
    height: h * 0.16,
    width: w * 0.30,
    child: Card(
      margin: EdgeInsets.zero,
      color: const Color.fromARGB(255, 71, 196, 190),
      elevation: 3.5,
      shadowColor: const Color.fromARGB(255, 207, 205, 205),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                SizedBox(height: h * 0.02),
                Icon(icon, color: iconColor, size: w * 0.09),
                SizedBox(height: h * 0.01),

                Text(
                  txt,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 142, 141, 141),
                  ),
                ),
                SizedBox(width: w * 0.12),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
