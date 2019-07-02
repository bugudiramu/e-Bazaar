import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/similar_products.dart';

import 'cart.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsImage;
  final productDetailsoldPrice;
  final productDetailsPrice;
  final productDetailsDesc;

  ProductDetails(
      {this.productDetailsName,
      this.productDetailsImage,
      this.productDetailsoldPrice,
      this.productDetailsPrice,
      this.productDetailsDesc});

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
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  "${widget.productDetailsName}",
                  style: TextStyle(
                      color: Color(0xFFB33771),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: IconButton(
                  color: Color(0xFFB33771),
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Container(
            height: 300.0,
            child: Image.asset(
              widget.productDetailsImage,
              // fit: BoxFit.cover,
            ),
          ),
          // --------------- Size , Color ,Quantity Buttons------------------
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Text("Size"),
                      IconButton(
                        onPressed: () {
                          _showDialog("Size", "Choose Size");
                        },
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Text("Color"),
                      IconButton(
                        onPressed: () {
                          _showDialog("Color", "Choose Color");
                        },
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Text("Qty"),
                      IconButton(
                        onPressed: () {
                          _showDialog("Quantity", "Choose Quantity");
                        },
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ------------------- Price Details ------------------

          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              children: <Widget>[
                Text("M.R.P. :  "),
                Text(
                  " ₹ ${widget.productDetailsoldPrice}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              children: <Widget>[
                Text("Price :  "),
                Text(
                  " ₹ ${widget.productDetailsPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              children: <Widget>[
                Text("You Save :  "),
                Text(
                  " ₹ ${widget.productDetailsoldPrice - widget.productDetailsPrice} Inclusive all taxes",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          //  ---------------------- Buy Now and Add to Cart Buttons ------------

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: MaterialButton(
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: Text("Buy Now"),
              onPressed: () {},
              color: Color(0xFFB33771),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
            child: MaterialButton(
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: Text("Add to Cart"),
              onPressed: () {},
              color: Color(0xFFB33771),
            ),
          ),

          // -------- About this Item ------------
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 20.0, bottom: 20.0),
            child: ListTile(
              title: Text(
                "About this Item",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text("${widget.productDetailsDesc}"),
              ),
            ),
          ),
          Padding(
            child: Text(
              "Similar Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
          ),
          Container(
            height: 400.0,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }

  _showDialog(String s, String c) {
    var _alert = AlertDialog(
      title: Text(s),
      content: Text(c),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => _alert);
  }
}
