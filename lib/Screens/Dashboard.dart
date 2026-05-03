import 'package:flutter/material.dart';
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final matqty = context.watch<AddmatProvider>().material.length;
    return Scaffold(
      backgroundColor: Appcolor.background,
      appBar: AppBar(backgroundColor: Appcolor.Mat),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: w * 0.05,
              vertical: h * 0.02,
            ),
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(w * 0.05),
              child: Column(
                children: [Text("Total Material"), Text("$matqty")],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
