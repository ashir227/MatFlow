import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';

class AddMaterial extends StatelessWidget {
  const AddMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.Mat,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: 100,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
