import 'package:firebase_auth/firebase_auth.dart';
import 'package:mdt_app/components/Formulaire.dart';
import 'package:flutter/material.dart';
import 'package:mdt_app/components/MyDrawer.dart';
import 'package:mdt_app/pages/loginPage.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? _user;
  late String greetingMessage;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ));
        print('User is currently signed out!');
      } else {
        setState(() {
          _user = user.email;
        });
      }
    });

    super.initState();
  }

  signOut() async {
    print("sign out");
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: Icon(Icons.menu),
          title: Text("Formulaire"),
        ),
        body: new Formulaire(),
        drawer: MyDrawer(
          emailUser: _user ?? "",
          onSignOut: signOut, // Passer la fonction signOut au Drawer
        ));
  }
}
