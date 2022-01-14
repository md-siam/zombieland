import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zombieland/theme/colors.dart';
import 'package:zombieland/views/home_page.dart';

void main() {
  // For disabling landscape view
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zombieland',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
