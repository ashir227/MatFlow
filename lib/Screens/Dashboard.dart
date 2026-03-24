import 'package:flutter/material.dart';
import 'package:matflow/Screens/drawer.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Appcolor.Mat),
      drawer: AppDrawer(),
      body: Column(children: []),
    );
  }
}
