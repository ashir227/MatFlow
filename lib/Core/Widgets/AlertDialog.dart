import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/Screens/Splash.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:provider/provider.dart';

Future<void> showAlert(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Appcolor.Mat,
        title: Text("Logout", style: TextStyle(color: Appcolor.background)),
        content: Text(
          "Are you sure want to logout?",
          style: TextStyle(color: Appcolor.background),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: TextStyle(color: Appcolor.background)),
          ),
          TextButton(
            onPressed: () {
              context.read<Loginprovider>().logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashScr()),
              );
            },
            child: Text("Logout", style: TextStyle(color: Appcolor.background)),
          ),
        ],
      );
    },
  );
}
