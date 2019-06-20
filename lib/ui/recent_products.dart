import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/product_detail.dart';

class RecentProducts extends StatefulWidget {
  @override
  _RecentProductsState createState() => _RecentProductsState();
}

class _RecentProductsState extends State<RecentProducts> {
  var _products = [
    {
      'name': 'Blazer',
      'image': 'images/santosImages/blazer1.jpeg',
      'oldPrice': 1200,
      'price': 900,
    },
    {
      'name': 'Dress',
      'image': 'images/santosImages/dress1.jpeg',
      'oldPrice': 888,
      'price': 200,
    },
    // {
    //   'name': 'Heals',
    //   'image': 'images/products/hills1.jpg',
    //   'oldPrice': 120,
    //   'price': 1020,
    // },
    // {
    //   'name': 'Skirt',
    //   'image': 'images/products/hills2.jpg',
    //   'oldPrice': 20,
    //   'price': 100,
    // }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: Hero(
            tag: _products[i]['name'],
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            product_details_name: _products[i]['name'],
                            product_details_image: _products[i]['image'],
                            product_details_oldPrice: _products[i]['oldPrice'],
                            product_details_price: _products[i]['price'],
                          ),
                    ),
                  ),
              child: GridTile(
                child: Image.asset(
                  _products[i]['image'],
                  fit: BoxFit.cover,
                ),
                footer: Container(
                  height: 65.0,
                  color: Colors.black38,
                  child: ListTile(
                    leading: Text(
                      "${_products[i]['name']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    title: Text(
                      "₹ ${_products[i]['price']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: Text(
                      "₹ ${_products[i]['oldPrice']}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough),
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
