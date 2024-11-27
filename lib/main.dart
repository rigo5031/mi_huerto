import 'package:flutter/material.dart';
import 'package:mi_huerto/screens/plantas_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Huerto',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PlantasScreen(),  
    );
  }
}
