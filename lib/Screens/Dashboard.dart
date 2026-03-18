import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/themes.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Appcolor.Mat),
      drawer: Drawer(backgroundColor: Appcolor.background),
      body: Column(children: []),
    );
  }
}
