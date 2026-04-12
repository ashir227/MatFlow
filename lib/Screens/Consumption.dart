import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/theme/colors.dart';

class ConsMat extends StatelessWidget {
  const ConsMat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.allbckgrnd,
      appBar: AppBar(
        centerTitle: true,
        title: Titletext(txt: "Add Consumption"),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(6),
        ),
        backgroundColor: Appcolor.Mat,
      ),
      body: Column(children: [Form(child: Column())]),
    );
  }
}
