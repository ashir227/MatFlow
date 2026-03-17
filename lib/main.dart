import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:matflow/Screens/Splash.dart';
import 'package:matflow/providers/loginProvider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox("loginBox");

  runApp(
    ChangeNotifierProvider(
      create: (_) => Loginprovider(),
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScr());
  }
}
