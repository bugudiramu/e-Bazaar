import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  CollectionReference ref = Firestore.instance.collection("cartItems");

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
    var height = MediaQuery.of(context).size.height;
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
            /* Container(
              padding: EdgeInsets.all(20.0),
              child:
                  Text("Cart Subtotal (1 item): ₹ ${widget.cartProductPrice}"),
            ),*/

            Container(
              height: height / 1.3,
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('cartItems').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return Card(
                          elevation: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.asset(
                                "${document.data['image']}",
                              ),
                              title: Text("${document.data['name']}"),
                              subtitle: Text("₹ ${document.data['price']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    Firestore.instance
                                        .collection("cartItems")
                                        .document(document.documentID)
                                        .delete();
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Item Deleted From Cart",
                                      toastLength: Toast.LENGTH_LONG);
                                },
                              ),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 12.0, bottom: 20.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                color: Color(0xFFB33771),
                minWidth: MediaQuery.of(context).size.width,
                textColor: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Proceed to Buy",
                  style: _btnStyle(),
                ),
                onPressed: () async => startPayment(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _btnStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
