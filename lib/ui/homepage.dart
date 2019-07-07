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
                    backgroundColor: Colors.transparent,
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
  // final List searchProd = ["arr", "allow", "Blazer", "ramu", "haz"];
  final List searchProd = [
    {
      'name': 'Blazer',
      'image': 'images/products/blazer1.jpg',
      'oldPrice': 1200,
      'price': 900,
      'prodDesc':
          "A blazer is a type of jacket resembling a suit jacket, but cut more casually. A blazer is generally distinguished from a sport coat as a more formal garment and tailored from solid colour fabrics. Blazers often have naval-style metal buttons to reflect their origins as jackets worn by boating club members. A blazer's cloth is usually durable, as it is intended as outdoor wear. Blazers are often part of a uniform that denotes, for example, an airline's employees, pupils of a particular school, members of sports clubs, or sportsmen and women on a particular team.",
    },
    {
      'name': 'Red-Blazer',
      'image': 'images/products/blazer2.jpg',
      'oldPrice': 1200,
      'price': 900,
      'prodDesc':
          "A blazer is a type of jacket resembling a suit jacket, but cut more casually. A blazer is generally distinguished from a sport coat as a more formal garment and tailored from solid colour fabrics. Blazers often have naval-style metal buttons to reflect their origins as jackets worn by boating club members. A blazer's cloth is usually durable, as it is intended as outdoor wear. Blazers are often part of a uniform that denotes, for example, an airline's employees, pupils of a particular school, members of sports clubs, or sportsmen and women on a particular team.",
    },
    {
      'name': 'Dress',
      'image': 'images/products/dress1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          "A dress (also known as a frock or a gown) is a garment consisting of a skirt with an attached bodice (or a matching bodice giving the effect of a one-piece garment).[1] It consists of a top piece that covers the torso and hangs down over the legs. A dress can be any one-piece garment containing a skirt of any length. Dresses can be formal or informal. In many cultures, dresses are more often worn by women and girls.The hemlines of dresses vary depending on the fashion of the time period and the modesty or personal taste of the wearer"
    },
    {
      'name': 'White-Dress',
      'image': 'images/products/dress2.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          "A dress (also known as a frock or a gown) is a garment consisting of a skirt with an attached bodice (or a matching bodice giving the effect of a one-piece garment).[1] It consists of a top piece that covers the torso and hangs down over the legs. A dress can be any one-piece garment containing a skirt of any length. Dresses can be formal or informal. In many cultures, dresses are more often worn by women and girls.The hemlines of dresses vary depending on the fashion of the time period and the modesty or personal taste of the wearer"
    },
    {
      'name': 'Blue-Jeans',
      'image': 'images/products/jeans1.jpg',
      'oldPrice': 1208,
      'price': 100,
      'prodDesc':
          'Jean also references a (historic) type of sturdy cloth commonly made with a cotton warp and wool weft (also known as "Virginia cloth"). Jean cloth can be entirely cotton as well, similar to denim. Originally designed for cowboys and miners, modern jeans became popular in the 1950s among teenagers, especially members of the greaser subculture.'
    },
    {
      'name': 'Jeans',
      'image': 'images/products/jeans2.jpg',
      'oldPrice': 3000,
      'price': 1200,
      'prodDesc':
          'Jean also references a (historic) type of sturdy cloth commonly made with a cotton warp and wool weft (also known as "Virginia cloth"). Jean cloth can be entirely cotton as well, similar to denim. Originally designed for cowboys and miners, modern jeans became popular in the 1950s among teenagers, especially members of the greaser subculture.'
    },
    {
      'name': 'Green-T-Shirt',
      'image': 'images/products/tshirt1.jpg',
      'oldPrice': 500,
      'price': 120,
      'prodDesc':
          'A T-shirt is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-shirts are generally made of a stretchy, light and inexpensive fabric and are easy to clean.'
    },
    {
      'name': 'T-Shirt',
      'image': 'images/products/tshirt2.jpg',
      'oldPrice': 499,
      'price': 20,
      'prodDesc':
          'A T-shirt is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-shirts are generally made of a stretchy, light and inexpensive fabric and are easy to clean.'
    },
    {
      'name': 'Skirt1',
      'image': 'images/products/skirt1.jpg',
      'oldPrice': 888,
      'price': 220,
      'prodDesc':
          'A skirt can be a draped garment made out of a single piece of fabric (such as pareos), but most skirts are fitted to the body at the waist or hips and fuller below, with the fullness introduced by means of darts, gores, pleats, or panels. Modern skirts are usually made of light to mid-weight fabrics, such as denim, jersey, worsted, or poplin. Skirts of thin or clingy fabrics are often worn with slips to make the material of the skirt drape better and for modesty.'
    },
    {
      'name': 'Skirt2',
      'image': 'images/products/skirt2.jpg',
      'oldPrice': 999,
      'price': 233,
      'prodDesc':
          'A skirt can be a draped garment made out of a single piece of fabric (such as pareos), but most skirts are fitted to the body at the waist or hips and fuller below, with the fullness introduced by means of darts, gores, pleats, or panels. Modern skirts are usually made of light to mid-weight fabrics, such as denim, jersey, worsted, or poplin. Skirts of thin or clingy fabrics are often worn with slips to make the material of the skirt drape better and for modesty.'
    },
    {
      'name': 'Shoe1',
      'image': 'images/products/shoe1.jpg',
      'oldPrice': 3999,
      'price': 2000,
      'prodDesc':
          'A shoe is an item of footwear intended to protect and comfort the human foot while the wearer is doing various activities. Shoes are also used as an item of decoration and fashion'
    },
    {
      'name': 'Shoe2',
      'image': 'images/products/shoe2.jpg',
      'oldPrice': 8999,
      'price': 2500,
      'prodDesc':
          'A shoe is an item of footwear intended to protect and comfort the human foot while the wearer is doing various activities. Shoes are also used as an item of decoration and fashion'
    },
    {
      'name': 'Heel1',
      'image': 'images/products/hills1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'High heels are a type of shoe in which the heel, compared with the toe, is significantly higher off the ground. These shoes go beyond simply protecting the foot from the ground or improving efficiency of walking.'
    },
    {
      'name': 'Heel2',
      'image': 'images/products/hills2.jpg',
      'oldPrice': 5000,
      'price': 1100,
      'prodDesc':
          'High heels are a type of shoe in which the heel, compared with the toe, is significantly higher off the ground. These shoes go beyond simply protecting the foot from the ground or improving efficiency of walking.'
    },
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
  Widget buildResults(
    BuildContext context,
  ) {
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
