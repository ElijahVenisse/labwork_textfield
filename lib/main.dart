import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home2.dart';
import 'package:flutter_application_2/screens/home_screen.dart';

void main() {
  runApp(LabWork());
}

class LabWork extends StatelessWidget {
  const LabWork({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppHomeScreen2(),
    );
  }
}
