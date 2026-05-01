import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/Text.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/Screens/MatDetail.dart';
import 'package:matflow/models/material_item.dart';
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
                final item = pro.material[index];
                return Column(
                  children: [
                    Row(children: []),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Matdetails(materialItem: item),
                          ),
                        );
                      },
                      // leading: ,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pro.material[index].name),
                          matStatus(item),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget matStatus(Materialitem itemz) {
  return Text(
    itemz.matinitstk < itemz.thresold ? "Low" : "OK",
    style: TextStyle(
      fontWeight: FontWeight.w600,
      color: itemz.matinitstk < itemz.thresold
          ? Colors.red
          : const Color.fromARGB(255, 68, 160, 71),
    ),
  );
}
