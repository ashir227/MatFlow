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
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Dcard(context)),
                SizedBox(width: w * 0.01),
                Expanded(child: Dcard(context)),
              ],
            ),
            SizedBox(height: h * 0.05),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Dcard(context)),
                SizedBox(width: w * 0.01),
                Expanded(child: Dcard(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
