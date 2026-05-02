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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Titletext(txt: "Material Item"),
        toolbarHeight: h * 0.12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(6),
        ),
        backgroundColor: Appcolor.Mat,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
        child: Consumer<AddmatProvider>(
          builder: (context, pro, _) {
            return Column(
              children: [
                SizedBox(height: h * 0.01),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: w * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text("Material")),
                      Expanded(flex: 2, child: Text("Available")),
                      Expanded(flex: 2, child: Text("Status")),
                      Expanded(child: Text("Remove")),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.01),
                Expanded(
                  child: ListView.builder(
                    itemCount: pro.material.length,
                    itemBuilder: (context, index) {
                      final item = pro.material[index];
                      return Column(
                        children: [
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

                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(pro.material[index].name),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${pro.material[index].matinitstk}",
                                  ),
                                ),
                                Expanded(flex: 3, child: matStatus(item)),
                              ],
                            ),

                            trailing: IconButton(
                              onPressed: () {
                                context.read<AddmatProvider>().deletematerial(
                                  item,
                                );
                              },
                              icon: Icon(Icons.delete_forever),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
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
