import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_image;
  final product_details_oldPrice;
  final product_details_price;

  ProductDetails({this.product_details_name,this.product_details_image,this.product_details_oldPrice,this.product_details_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ListView(),
    );
      
  }
}