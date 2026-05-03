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
    return Scaffold(
      backgroundColor: Appcolor.background,
      appBar: AppBar(backgroundColor: Appcolor.Mat),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Dcard(context)],
        ),
      ),
    );
  }
}
