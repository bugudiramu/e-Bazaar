import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/cart_product_details.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("My Orders"),
      ),
      body: Container(
        height: 400.0,
        child: CartProductDetails(),
      ),
    );
  }
}
