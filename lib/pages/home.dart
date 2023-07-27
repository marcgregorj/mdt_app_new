//import 'package:mdt_app/pages/FormPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdt_app/pages/FormPage.dart';
import 'package:mdt_app/pages/loginPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

 /*   Future.delayed(const Duration(seconds: 6), () {
      
    });*/


     Future.delayed(const Duration(seconds: 5))
      .then((value) => {
          Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) =>  const LoginPage(),
          ),
        )
      });

      
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: double.infinity,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 20,),
                Text(
                  "Application d'Enquête Touristique",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                  )
                ),
                  const SizedBox(height: 30,),
                  const Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15
                  ),
                  ),
          ],
        ),
      ),
    );
  }
}
