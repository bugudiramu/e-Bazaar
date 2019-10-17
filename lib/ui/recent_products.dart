import 'package:flutter/material.dart';
import 'package:shopping_cart/model/products.dart';
import 'package:shopping_cart/screens/product_detail.dart';

class RecentProducts extends StatefulWidget {
  @override
  _RecentProductsState createState() => _RecentProductsState();
}

class _RecentProductsState extends State<RecentProducts> {
  Products _products = Products();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _products.products.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: Hero(
            tag: _products.products[i]['name'],
            child: Material(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      productDetailsName: _products.products[i]['name'],
                      productDetailsImage: _products.products[i]['image'],
                      productDetailsoldPrice: _products.products[i]['oldPrice'],
                      productDetailsPrice: _products.products[i]['price'],
                      productDetailsDesc: _products.products[i]['prodDesc'],
                    ),
                  ),
                ),
                child: GridTile(
                  child: Image.asset(
                    _products.products[i]['image'],
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
                            "${_products.products[i]['name']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "₹ ${_products.products[i]['price']}",
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
