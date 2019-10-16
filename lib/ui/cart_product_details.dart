import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_plugin/razorpay_plugin.dart';
import 'package:shopping_cart/model/payment.dart';

class CartProductDetails extends StatefulWidget {
  final cartProductName;
  final cartProductImage;
  final cartProductPrice;

  CartProductDetails({
    this.cartProductName,
    this.cartProductImage,
    this.cartProductPrice,
  });

  @override
  _CartProductDetailsState createState() => _CartProductDetailsState();
}

class _CartProductDetailsState extends State<CartProductDetails> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  var totoalCartPrice;
  @override
  void initState() {
    super.initState();
  }

  RozarPayModel key = RozarPayModel();
// Enables us to start the payment service
  startPayment() async {
    Map<String, dynamic> options = Map();
    options.putIfAbsent("name", () => "${widget.cartProductName}");
    options.putIfAbsent(
        "image", () => "https://www.73lines.com/web/image/12427");
    options.putIfAbsent("description", () => "RozarPay Transaction");
    options.putIfAbsent("amount", () => "${widget.cartProductPrice * 100}");
    options.putIfAbsent("email", () => "ramubugudi4@gmail.com");
    options.putIfAbsent("contact", () => "8919308004");
    options.putIfAbsent("theme", () => "#000000");
    options.putIfAbsent("api_key", () => "${key.API_KEY}");
    Map<dynamic, dynamic> paymentResponse = Map();
    paymentResponse = await Razorpay.showPaymentForm(options);
    print("response $paymentResponse");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("Cart"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child:
                  Text("Cart Subtotal (1 item): ₹ ${widget.cartProductPrice}"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 12.0, bottom: 20.0),
              child: MaterialButton(
                textColor: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Text("Proceed to Buy"),
                onPressed: () async => startPayment(),
                color: Color(0xFFB33771),
              ),
            ),
            Divider(
              height: 5.0,
              color: Colors.grey,
            ),
            Container(
              color: Colors.red,
              height: 600.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('cartItems').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            leading: Image.asset(
                              "${document.data['image']}",
                            ),
                            title: Text("${document.data['name']}"),
                            subtitle: Text("₹ ${document.data['price']}"),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                              ),
                              onPressed: () async {
                                setState(() {
                                  totoalCartPrice = document.data['price'];
                                  // liked = !liked;
                                  Firestore.instance
                                      .collection("cartItems")
                                      .document(document.documentID)
                                      .delete();
                                });
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  List _productsAddedInTheCart = [
    {
      'name': 'Blazer',
      'image': 'images/recentImages/blazer1.jpeg',
      'price': 900,
      'size': "M",
      'color': "Blue",
      'qty': 1,
    },
    {
      'name': 'Dress',
      'image': 'images/recentImages/dress2.jpeg',
      'price': 200,
      'size': "L",
      'color': "Red",
      'qty': 5,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _productsAddedInTheCart.length,
      itemBuilder: (BuildContext context, int i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),

          // --------------- Deletes the items in the cart by swiping ----------
          child: Dismissible(
            key: Key(_productsAddedInTheCart[i]['name']),
            onDismissed: (direction) {
              setState(() {
                _productsAddedInTheCart.removeAt(i);
              });
              // ------------------- Trying to Implement Undo operation ------------------
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(
              //     content: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: <Widget>[
              //         Expanded(
              //             child: Text(
              //                 "${_productsAddedInTheCart[i]["name"]} dismissed")),
              //         Expanded(child: Text("Undo")),
              //       ],
              //     ),
              //   ),
              // );
            },
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
              ),
              child: Center(
                child: ListTile(
                  leading: Text(
                    "Archive",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              // color: Colors.red,
            ),
            child: Card(
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                        _productsAddedInTheCart[i]['image'],
                      ),
                      title: Text("${_productsAddedInTheCart[i]['name']}"),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                  "₹ ${_productsAddedInTheCart[i]['price']}")),
                          IconButton(
                            icon: Icon(Icons.arrow_drop_down),
                            onPressed: () => decrementInQty(i),
                          ),
                          Text("${_productsAddedInTheCart[i]['qty']}"),
                          IconButton(
                            icon: Icon(Icons.arrow_drop_up),
                            onPressed: () => incrementInQty(i),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                                "Qty: ${_productsAddedInTheCart[i]['qty']}")),
                        Expanded(
                            child: Text(
                                "Size: ${_productsAddedInTheCart[i]['size']}")),
                        Expanded(
                          child: Text(
                              "Color: ${_productsAddedInTheCart[i]['color']}"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  

  void incrementInQty(int index) {
    setState(() {
      _productsAddedInTheCart[index]['qty'] =
          _productsAddedInTheCart[index]['qty'] + 1;
    });
  }

  decrementInQty(int index) {
    setState(() {
      _productsAddedInTheCart[index]['qty'] =
          _productsAddedInTheCart[index]['qty'] - 1;
    });
  }*/
