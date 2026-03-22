import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/bottomSheet.dart';
import 'package:matflow/Core/Widgets/icon.dart';
// import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/providers/image_pick.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:provider/provider.dart';

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
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.only(left: 25, top: 20, bottom: 10),
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
                  CustmText(text: "MatFlow", size: 40, weight: FontWeight.w500),
                  Text(
                    "Material and Production Management",
                    style: TextStyle(color: Appcolor.background, fontSize: 15),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Consumer<ImagePckProvider>(
                        builder: (ctx, pro, __) {
                          return GestureDetector(
                            onTap: () {
                              showImagesource(context);
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                              backgroundImage: pro.image != null
                                  ? FileImage(pro.image!)
                                  : null,
                              child: pro.image == null
                                  ? Icon(
                                      Icons.person, // default profile icon
                                      size: 35,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 25),
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
          ListTile(
            leading: CustomIcon(icon: Icons.trending_up_outlined),
            title: Text("Consumption", style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            leading: CustomIcon(icon: Icons.calendar_month_rounded),
            title: Text("Planning / Forecast", style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            leading: CustomIcon(icon: Icons.receipt_long_rounded),
            title: Text("Reports", style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          SizedBox(height: 40),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Provider.of<Loginprovider>(context, listen: false).logout();
              },
              icon: Icon(Icons.logout),
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Appcolor.logoutColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Appcolor.background,
    );
  }
}
