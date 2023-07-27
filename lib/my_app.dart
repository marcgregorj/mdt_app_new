import 'package:flutter/material.dart';
import 'package:mdt_app/pages/home.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Application d'enquette",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: "Application d'enquette"),
      debugShowCheckedModeBanner: false,
    );
  }
}
