import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopping_cart/ui/drawer.dart';
import 'package:shopping_cart/ui/recent_products.dart';
import '../ui/category_images.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("e-Bazaar"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search");
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print("Cart");
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _imgCarousel(),
          _categories(),
          CategoryImages(),
          Padding(
            child: Text("Recent Products"),
            padding: EdgeInsets.all(10.0),
          ),
          //grid view
          Container(
            height: 320.0,
            child: RecentProducts(),
          ),
        ],
      ),
    );
  }

  Widget _imgCarousel() {
    return Container(
      height: 200.0,
      child: Carousel(
        dotSize: 5.0,
        autoplayDuration: Duration(milliseconds: 1000),
        // dotColor: Colors.white,
        indicatorBgPadding: 10.0,
        animationDuration: Duration(milliseconds: 1000),
        autoplay: false,
        animationCurve: Curves.easeInOutSine,
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

  Widget _categories() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Categories"),
    );
  }
}
