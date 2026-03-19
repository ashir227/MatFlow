import 'package:flutter/material.dart';
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
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Appcolor.iconFlow,
                size: 35,
              ),
            ),
            ListTile(leading: Icon(Icons.inventory, color: Appcolor.iconFlow)),
            ListTile(
              leading: Icon(
                Icons.add_circle_outline_outlined,
                color: Appcolor.iconFlow,
              ),
            ),
          ],
        ),
        backgroundColor: Appcolor.background,
      ),
      body: Column(children: []),
    );
  }
}
