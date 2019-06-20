import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/similar_products.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_image;
  final product_details_oldPrice;
  final product_details_price;
  final product_details_desc;

  ProductDetails(
      {this.product_details_name,
      this.product_details_image,
      this.product_details_oldPrice,
      this.product_details_price,
      this.product_details_desc});

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
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  "${widget.product_details_name}",
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
              widget.product_details_image,
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
                  " ₹ ${widget.product_details_oldPrice}",
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
                  " ₹ ${widget.product_details_price}",
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
                  " ₹ ${widget.product_details_oldPrice - widget.product_details_price} Inclusive all taxes",
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
                child: Text("${widget.product_details_desc}"),
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
