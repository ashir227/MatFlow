import 'package:flutter/material.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/themes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: sort_child_properties_last
      child: ListView(
        children: [
          SizedBox(
            height: 230,
            child: DrawerHeader(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(left: 25, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Appcolor.Mat, Appcolor.gradientEnd],
                ),
                color: Appcolor.background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MatFlow",
                    style: TextStyle(
                      color: Appcolor.background,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Material and Production Management",
                    style: TextStyle(color: Appcolor.background, fontSize: 15),
                  ),
                ],
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
          ListTile(leading: CustomIcon(icon: Icons.trending_up_outlined)),
        ],
      ),
      backgroundColor: Appcolor.background,
    );
  }
}
