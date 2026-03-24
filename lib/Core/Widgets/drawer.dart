import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/Widgets/bottomSheet.dart';
import 'package:matflow/Core/Widgets/dreawerTextfield.dart';
import 'package:matflow/Core/Widgets/icon.dart';
import 'package:matflow/Core/Widgets/AlertDialog.dart';
// import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/providers/image_pick.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  final namecontroller = TextEditingController();

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
                              radius: 35,
                              backgroundColor: Colors.grey,
                              backgroundImage: pro.image != null
                                  ? FileImage(pro.image!)
                                  : null,
                              child: pro.image == null
                                  ? Icon(
                                      Icons.person, // default profile icon
                                      size: 40,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 22),
                      Column(
                        children: [
                          Consumer<Loginprovider>(
                            builder: (context, user, __) {
                              return CustmText(
                                text: user.name.isEmpty ? "Guest " : user.name,
                                size: 24,
                                weight: FontWeight.bold,
                              );
                            },
                          ),
                          SizedBox(height: 1),
                          Consumer<Loginprovider>(
                            builder: (context, desi, __) {
                              return CustmText(
                                text: desi.desig.isEmpty
                                    ? "Guest "
                                    : desi.desig,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 25),
          DrawTextField(
            text: "Dashboard",
            icon: Icon(Icons.dashboard_outlined, color: Appcolor.Flow),
          ),
          DrawTextField(
            text: "Material List",
            icon: Icon(Icons.inventory_2_outlined, color: Appcolor.Flow),
          ),
          DrawTextField(
            text: "Add Material",
            icon: Icon(Icons.add_circle_outline_outlined, color: Appcolor.Flow),
          ),
          DrawTextField(
            text: "Consumption",
            icon: Icon(Icons.trending_up_outlined, color: Appcolor.Flow),
          ),
          DrawTextField(
            text: "Planning / Forecast",
            icon: Icon(Icons.calendar_month_rounded, color: Appcolor.Flow),
          ),
          DrawTextField(
            text: "Reports",
            icon: Icon(Icons.receipt_long_rounded, color: Appcolor.Flow),
          ),
          SizedBox(height: 40),
          ListTile(
            onTap: () {
              showAlert(context);
            },
            leading: CustomIcon(
              icon: Icons.logout,
              color: Appcolor.logoutColor,
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
