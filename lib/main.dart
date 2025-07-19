import 'package:dictonary_app/screens/dictionary_screen.dart';
import 'package:dictonary_app/ui_helper/colors/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppPallete.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DictionaryScreen(),
    );
  }
}
