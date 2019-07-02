import 'package:flutter/material.dart';

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var _products = [
    {
      'name': 'Blazer',
      'image': 'images/recentImages/blazer1.jpeg',
      'oldPrice': 1200,
      'price': 900,
    },
    {
      'name': 'Dress',
      'image': 'images/recentImages/dress1.jpeg',
      'oldPrice': 888,
      'price': 200,
    },
    {
      'name': 'Heals1',
      'image': 'images/recentImages/skt1.jpeg',
      'oldPrice': 1020,
      'price': 910,
    },
    {
      'name': 'Heals',
      'image': 'images/recentImages/hills1.jpeg',
      'oldPrice': 1020,
      'price': 910,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: Hero(
            tag: _products[i]['name'],
            child: Material(
              child: InkWell(
                child: GridTile(
                  child: Image.asset(
                    _products[i]['image'],
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    height: 30.0,
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${_products[i]['name']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "₹ ${_products[i]['price']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
