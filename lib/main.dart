import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_practce/pages/home_page.dart';

void main (){
  runApp(App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: HomePage(),

      theme: ThemeData(primarySwatch: Colors.yellow,
        // scrollbarTheme:ScrollbarThemeData(
        // interactive: true,
        // // isAlwaysShown: true,
        // radius: const Radius.circular(10.0),
        // thumbColor: MaterialStateProperty.all(
        //    Colors.black54,)
      //
      // ),
      ),
    );
  }
}
