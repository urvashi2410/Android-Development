import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(MyApp());
}

// override is used to give my app's build more weightage than the inherited one
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // to disable the debug
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
