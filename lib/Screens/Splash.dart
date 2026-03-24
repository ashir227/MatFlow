import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/Screens/Dashboard.dart';
import 'package:matflow/Screens/login.dart';
import 'package:matflow/providers/image_pick.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:provider/provider.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<Loginprovider>(context, listen: false).loadUsername();
    });
    Future.microtask(() {
      Provider.of<ImagePckProvider>(context, listen: false).loadimage();
    });

    Future.delayed(Duration(seconds: 3), () {
      var box = Hive.box("loginbox");
      bool isLogin = box.get("islogin", defaultValue: false);
      if (isLogin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScr()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(child: Image.asset("assets/images/Logo.png")),
      ),
    );
  }
}
