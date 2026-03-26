import 'package:flutter/material.dart';
import 'package:matflow/Core/buttons/elevated.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/Screens/Dashboard.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:provider/provider.dart';

class LoginScr extends StatelessWidget {
  LoginScr({super.key});
  final namecontroller = TextEditingController();
  final desigcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: "Username",
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
                  controller: desigcontroller,

                  decoration: InputDecoration(
                    hintText: "Designation",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Appcolor.Flow, width: 1.5),
                    ),
                  ),
                ),

                SizedBox(height: 27),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Appcolor.Flow, width: 1.5),
                    ),
                  ),
                ),
                SizedBox(height: 75),
                CustomButton.elevatedB(
                  onPressed: () {
                    bool result =
                        Provider.of<Loginprovider>(
                          context,
                          listen: false,
                        ).login(
                          namecontroller.text,
                          desigcontroller.text,
                          passwordcontroller.text,
                        );

                    if (result) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DashBoard()),
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("data")));
                    }
                  },

                  Bcolor: Appcolor.Mat,
                  text: "Login",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
