import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopping_cart/screens/about.dart';
import 'package:shopping_cart/screens/cart.dart';
import 'package:shopping_cart/screens/contact.dart';
import 'package:shopping_cart/screens/loginPage.dart';
import 'package:shopping_cart/screens/myAccount.dart';
import 'package:shopping_cart/screens/myOrders.dart';
import 'package:shopping_cart/screens/settings.dart';
import 'package:shopping_cart/ui/recent_products.dart';

class HomePage extends StatefulWidget {
  final searchProdName;
  final searchProdImage;
  final searchProdPrice;

  HomePage({
    this.searchProdName,
    this.searchProdImage,
    this.searchProdPrice,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkmode = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseUser currentUser;
  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    firebaseAuth.currentUser().then((FirebaseUser user) {
      setState(() {
        // call setState to rebuild the view
        this.currentUser = user;
      });
    });
  }

  String userName() {
    if (currentUser != null) {
      if (currentUser.displayName == null) {
        return currentUser.email.replaceAll('@gmail.com', '');
      }
      return currentUser.displayName;
    } else {
      return "";
    }
  }

  String email() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "No Email Address";
    }
  }

  String photoUrl() {
    if (currentUser != null) {
      return currentUser.photoUrl;
    } else {
      return "A";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "e-Bazaar",
      debugShowCheckedModeBanner: false,
      theme: darkmode
          ? ThemeData(brightness: Brightness.dark, fontFamily: 'Montserrat')
          : ThemeData(brightness: Brightness.light, fontFamily: 'Montserrat'),
      home: Scaffold(
        // Drawer Start
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFB33771),
                ),
                // accountEmail: Text("ramubugudi4@gmail.com"),
                accountName: Text("${userName()}"),
                accountEmail: Text("${email()}"),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.network(
                      '${photoUrl()}',
                      scale: 1.0,
                    ),
                    // child: Icon(
                    //   Icons.person,
                    //   color: Colors.white,
                    // ),
                  ),
                ),
              ),
              ListTile(
                leading: darkmode
                    ? Image.asset(
                        'images/moon.png',
                        height: 30.0,
                        width: 26.0,
                      )
                    : Image.asset(
                        'images/sunny.png',
                        height: 30.0,
                        width: 26.0,
                      ),
                title: Text("DarkMode"),
                trailing: Switch(
                  value: darkmode,
                  onChanged: (val) {
                    setState(() {
                      darkmode = val;
                    });
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyAccount()));
                },
                child: _showList(
                  "My Account",
                  (Icons.account_box),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyOrders()));
                },
                child: _showList(
                  "My Orders",
                  (Icons.shopping_basket),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                child: _showList(
                  "Settings",
                  (Icons.settings),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => About()));
                },
                child: _showList(
                  "About",
                  (Icons.adjust),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Contact()));
                },
                child: _showList(
                  "Contact",
                  (Icons.contact_phone),
                ),
              ),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  });
                },
                child: _showList(
                  "LogOut",
                  (Icons.exit_to_app),
                ),
              ),
            ],
          ),
        ),
        // Drawer ends
        appBar: AppBar(
          titleSpacing: 2.0,
          elevation: 0,
          backgroundColor: Color(0xFFB33771),
          title: Text("e-Bazaar"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ProductSearch());
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            _imgCarousel(),
            // _categories(),
            // CategoryImages(),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            //grid view
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: RecentProducts(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imgCarousel() {
    return Container(
      height: 200.0,
      child: Carousel(
        overlayShadow: true,
        overlayShadowColors: Colors.black45,
        dotSize: 5.0,
        autoplay: true,
        animationCurve: Curves.bounceInOut,
        dotBgColor: Colors.transparent,
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/c5.jpg'),
          AssetImage('images/c2.jpg'),
          AssetImage('images/c3.jpg'),
          AssetImage('images/c4.jpg'),
          AssetImage('images/c6.jpg'),
        ],
      ),
    );
  }

  Widget _showList(String s, IconData i) {
    return ListTile(
      leading: Icon(
        i,
        color: Colors.yellow[700],
      ),
      title: Text(s),
    );
  }

  // Widget _categories() {
  //   return Container(
  //     padding: EdgeInsets.all(10.0),
  //     alignment: Alignment.centerLeft,
  //     child: Text(
  //       "Categories",
  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
  //     ),
  //   );
  // }
}

// SearchBar

class ProductSearch extends SearchDelegate<String> {
  final List searchProd = [
    'Blazer',
    'Dress',
    'Kurtha',
  ];
  final List recentSearchProd = [
    'Blazer',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show results for given keyword
    return Center(
        child: CircularProgressIndicator(backgroundColor: Colors.redAccent));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // shows suggestions for keyword
    final suggestionList = query.isEmpty
        ? recentSearchProd
        : searchProd.where((s) => s.toLowerCase().startsWith(query)).toList();
    // contains,startswith,endswith and so on
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (_, int i) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.shopping_basket),
          title: RichText(
            text: TextSpan(
              text: suggestionList[i].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[i].substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        );
      },
    );
  }
}
