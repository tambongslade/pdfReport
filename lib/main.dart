import 'package:flutter/material.dart';
import 'package:pdf_report/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Pdf Reader',
    debugShowCheckedModeBanner: false  ,
      home:  HomePage(),
    );
  }
}
