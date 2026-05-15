import 'package:flutter/material.dart';
import 'package:matflow/Core/Widgets/DashCard.dart';
import 'package:matflow/Core/Widgets/DashQuickAct.dart';
import 'package:matflow/Core/Widgets/Textfield.dart';
import 'package:matflow/Screens/Consignment.dart';
import 'package:matflow/Screens/Consumption.dart';
import 'package:matflow/Screens/Materiallist.dart';
import 'package:matflow/Screens/drawer.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    var matcount = context.watch<AddmatProvider>().material.length;
    final totals = context.watch<AddmatProvider>().unitcount();
    var lowcount = context.watch<AddmatProvider>().lowstk();

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Appcolor.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard", style: TextStyle(color: Appcolor.background)),
        backgroundColor: Appcolor.Mat,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.yellow,
          margin: EdgeInsets.only(top: h * 0.05),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dcard(
                    context,
                    "Total\nMaterial",
                    Icons.monitor,
                    const Color.fromARGB(255, 46, 178, 240),
                    "$matcount",
                  ),
                  SizedBox(width: w * 0.01),
                  Dcard(
                    context,
                    "Total\nStock",
                    Icons.balance_rounded,
                    const Color.fromARGB(182, 19, 114, 44),
                    "${totals["kg"]} KG\n${totals["pcs"]} Pcs",
                  ),
                ],
              ),
              SizedBox(height: h * 0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dcard(
                    context,
                    "Low \n Stock",
                    Icons.warning,
                    const Color.fromARGB(255, 231, 103, 103),
                    "$lowcount",
                  ),
                  SizedBox(width: w * 0.01),
                  Dcard(
                    context,
                    "Plainning",
                    Icons.monitor_heart,
                    const Color.fromARGB(255, 198, 198, 97),
                    "ff",
                  ),
                ],
              ),
              SizedBox(height: h * 0.10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quick Action",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAct(
                        context,
                        "Add Consignment",
                        Icons.add,
                        Appcolor.Mat,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Consignment(),
                            ),
                          );
                        },
                      ),
                      QuickAct(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConsMat()),
                          );
                        },
                        context,
                        "Add Consumption",
                        Icons.content_paste_go_outlined,
                        Appcolor.Mat,
                      ),
                      QuickAct(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MatlistScr(),
                            ),
                          );
                        },
                        context,
                        "Mat List",
                        Icons.hexagon_outlined,
                        Appcolor.Mat,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
