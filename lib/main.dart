import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matflow/Screens/Splash.dart';
import 'package:matflow/models/material_item.dart';
import 'package:matflow/providers/addmatlist.dart';
import 'package:matflow/providers/image_pick.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive with app documents directory
  final directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(MaterialitemAdapter());
  // Open Hive box
  await Hive.openBox("loginbox");
  await Hive.openBox("imgbox");
  await Hive.openBox("materials");

  // Run the app with providers
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Loginprovider()),
        ChangeNotifierProvider(create: (_) => ImagePckProvider()),
        ChangeNotifierProvider(create: (_) => AddmatProvider()),
      ],
      child: const MyApp(), // Attach your app here
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScr(),
    );
  }
}
