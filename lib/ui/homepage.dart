import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopping_cart/screens/cart.dart';
import 'package:shopping_cart/ui/drawer.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
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
    return null;
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
