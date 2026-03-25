import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';

class AddMaterial extends StatelessWidget {
  const AddMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Material")),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: SingleChildScrollView(child: Column(children: [])),
          ),
        ),
      ),
    );
  }
}
