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
            SizedBox(
              height: 200,
              child: DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Appcolor.Mat, Appcolor.gradientEnd],
                  ),
                  color: Appcolor.background,
                ),
                child: Text(
                  "MatFlow",
                  style: TextStyle(color: Appcolor.background, fontSize: 50),
                ),
              ),
            ),
            ListTile(
              leading: CustomIcon(icon: Icons.dashboard_outlined),
              title: Text("Dashboard", style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: CustomIcon(icon: Icons.inventory_2_outlined),
              title: Text("Material List", style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: CustomIcon(icon: Icons.add_circle_outline_outlined),
              title: Text("Add Material", style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
          ],
        ),
        backgroundColor: Appcolor.background,
      ),
      body: Column(children: []),
    );
  }
}
