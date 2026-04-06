import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class MatlistScr extends StatelessWidget {
  const MatlistScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Titletext(txt: "Material Item"),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(6),
        ),
        backgroundColor: Appcolor.Mat,
      ),
      body: Container(
        child: Consumer<AddmatProvider>(
          builder: (context, pro, _) {
            return ListView.builder(
              itemCount: pro.material.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(pro.material[index].name));
              },
            );
          },
        ),
      ),
    );
  }
}
