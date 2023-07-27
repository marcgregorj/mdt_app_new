import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String emailUser;
  final VoidCallback onSignOut; // Ajout de la fonction signOut

  MyDrawer({required this.emailUser, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: Colors.grey),
            accountName: Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              emailUser,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: Icon(
              Icons.account_circle,
              color: Colors.redAccent,
              size: 80,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Accueil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: const Text('Déconnexion'),
            onTap: onSignOut,
          ),
          // Ajoutez d'autres ListTiles ou éléments du drawer si nécessaire.
        ],
      ),
    );
  }
}
