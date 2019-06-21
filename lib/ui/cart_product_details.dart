import 'package:flutter/material.dart';

class CartProductDetails extends StatefulWidget {
  final cartProductName;
  final cartProductImage;
  final cartProductPrice;
  final cartProductSize;
  final cartProductColor;
  final cartProductQty;

  CartProductDetails({
    this.cartProductName,
    this.cartProductImage,
    this.cartProductPrice,
    this.cartProductSize,
    this.cartProductColor,
    this.cartProductQty,
  });

  @override
  _CartProductDetailsState createState() => _CartProductDetailsState();
}

class _CartProductDetailsState extends State<CartProductDetails> {
  List _productsAddedInTheCart = [
    {
      'name': 'Blazer',
      'image': 'images/santosImages/blazer1.jpeg',
      'price': 900,
      'size': "M",
      'color': "Blue",
      'qty': 1,
    },
    {
      'name': 'Dress',
      'image': 'images/santosImages/dress2.jpeg',
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
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: <Widget>[
              //         Expanded(
              //             child:
              //                 Text("${_productsAddedInTheCart[i]} dismissed")),
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
                            icon: Icon(Icons.arrow_drop_up),
                            onPressed: () => incrementInQty(i),
                          ),
                          Text("${_productsAddedInTheCart[i]['qty']}"),
                          IconButton(
                            icon: Icon(Icons.arrow_drop_down),
                            onPressed: () => decrementInQty(i),
                          )
                        ],
                      ),
                      // trailing: Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     Container(
                      //       child: IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(Icons.arrow_drop_down_circle),
                      //       ),
                      //     ),
                      // Text("${_productsAddedInTheCart[i]['qty']}"),
                      // ],
                      // ),
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
  }

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
  }
}
