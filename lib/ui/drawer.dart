import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/loginPage.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFB33771),
            ),
            accountEmail: Text("ramubugudi4@gmail.com"),
            accountName: Text("Ramu"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: _showList(
              "Home",
              (Icons.home),
            ),
          ),
          InkWell(
            onTap: () {},
            child: _showList(
              "My Account",
              (Icons.account_box),
            ),
          ),
          InkWell(
            onTap: () {},
            child: _showList(
              "My Orders",
              (Icons.shopping_basket),
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: _showList(
          //     "Categories",
          //     (Icons.dashboard),
          //   ),
          // ),
          InkWell(
            onTap: () {},
            child: _showList(
              "Favorites",
              (Icons.favorite),
            ),
          ),
          InkWell(
            onTap: () {},
            child: _showList(
              "Settings",
              (Icons.settings),
            ),
          ),
          InkWell(
            onTap: () {},
            child: _showList(
              "About",
              (Icons.adjust),
            ),
          ),
          InkWell(
            onTap: () {},
            child: _showList(
              "Contact",
              (Icons.contact_phone),
            ),
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              });

              //    Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => Login()));
            },
            child: _showList(
              "LogOut",
              (Icons.exit_to_app),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showList(String s, IconData i) {
    return ListTile(
      leading: Icon(i),
      title: Text(s),
    );
  }
}
