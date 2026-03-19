import 'package:flutter/material.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/themes.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Appcolor.Mat),
      drawer: Drawer(
        // ignore: sort_child_properties_last
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Appcolor.Mat, Appcolor.gradientEnd],
                ),
                color: Appcolor.background,
              ),
              child: Text("data", style: TextStyle(color: Appcolor.background)),
            ),
            ListTile(leading: CustomIcon(icon: Icons.dashboard_outlined)),
            ListTile(leading: CustomIcon(icon: Icons.inventory_2_outlined)),
            ListTile(
              leading: CustomIcon(icon: Icons.add_circle_outline_outlined),
            ),
          ],
        ),
        backgroundColor: Appcolor.background,
      ),
      body: Column(children: []),
    );
  }
}
