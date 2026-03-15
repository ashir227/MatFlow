import 'package:flutter/material.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/themes.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:provider/provider.dart';

class LoginScr extends StatelessWidget {
  LoginScr({super.key});
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: double.infinity,
        width: double.infinity,
        // color: Colors.yellow,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/Logo.png", height: 320, width: 320),
              SizedBox(height: 27),

              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  // enabledBorder: ,
                  border: OutlineInputBorder(
                    //
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Appcolor.focusedBorder,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 27),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Appcolor.focusedBorder,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 75),
              CustomButton.elevatedB(
                onPressed: () {
                  // Provider.of<Loginprovider>(context).login(name, password)
                },

                Bcolor: Appcolor.Mat,
                text: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
