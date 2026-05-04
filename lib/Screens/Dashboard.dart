import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/DashCard.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Screens/drawer.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Appcolor.background,
      appBar: AppBar(backgroundColor: Appcolor.Mat),
      drawer: AppDrawer(),
      body: Container(
        // color: Colors.yellow,
        margin: EdgeInsets.only(top: h * 0.05),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dcard(context, "Total\nMaterial"),
                SizedBox(width: w * 0.01),
                Dcard(context, "Total Stock"),
              ],
            ),
            SizedBox(height: h * 0.05),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dcard(context, "Low \n Stock"),
                SizedBox(width: w * 0.01),
                Dcard(context, "Plainning"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
