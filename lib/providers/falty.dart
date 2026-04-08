// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:provider/provider.dart';

// class Materialmodel {
//   String name;
//   int QTY;
//   Materialmodel({required this.QTY, required this.name});
// }

// class Addcrd extends StatelessWidget {
//   final namecon = TextEditingController();
//   final qtycon = TextEditingController();

//   Addcrd({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ElevatedButton(
//         onPressed: () {
//           Materialmodel matobject = Materialmodel(
//             name: namecon.text,
//             QTY: int.parse(qtycon.text),
//           );
//         },
//         child: Text("dsddddd"),
//       ),
//     );
//   }
// }

// class Addprov extends ChangeNotifier {
//   addmat(Material matobject) {
//     List<Materialmodel> matitem = [];
//     var box = Hive.box("material");
//     box.add(matobject);
//     matitem = box.values.cast<Materialmodel>().toList();
//     notifyListeners();
//   }
// }
// class Listviw extends StatelessWidget {
//   const Listviw({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Consumer<Addprov>(builder: (context,prov,_){
//             return ListView.builder(
//                 itemCount: prov.addmat(matobject)
//                 itemBuilder: (context,index))
//         }),
//     );
//   }
// }
