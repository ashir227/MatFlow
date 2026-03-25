import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';

class AddMaterial extends StatelessWidget {
  const AddMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Material"),
        backgroundColor: Appcolor.Mat,
      ),

      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("Test Form"), // 👈 ye add karo test ke liye
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
