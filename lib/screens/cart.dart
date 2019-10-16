import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/cart_product_details.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("Cart"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Cart Subtotal (1 item): ₹ 1100"),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 12.0, bottom: 20.0),
            child: MaterialButton(
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: Text("Proceed to Buy"),
              onPressed: () {},
              color: Color(0xFFB33771),
            ),
          ),
          Divider(
            height: 5.0,
            color: Colors.grey,
          ),
          Container(
              height: 400.0,
              child: CartProductDetails(
              )),
        ],
      ),
    );
  }
}
