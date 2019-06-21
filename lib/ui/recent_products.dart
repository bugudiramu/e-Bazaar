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
      'prodDesc':
          "A blazer is a type of jacket resembling a suit jacket, but cut more casually. A blazer is generally distinguished from a sport coat as a more formal garment and tailored from solid colour fabrics. Blazers often have naval-style metal buttons to reflect their origins as jackets worn by boating club members. A blazer's cloth is usually durable, as it is intended as outdoor wear. Blazers are often part of a uniform that denotes, for example, an airline's employees, pupils of a particular school, members of sports clubs, or sportsmen and women on a particular team.",
    },
    {
      'name': 'Dress',
      'image': 'images/santosImages/dress1.jpeg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          "A dress (also known as a frock or a gown) is a garment consisting of a skirt with an attached bodice (or a matching bodice giving the effect of a one-piece garment).[1] It consists of a top piece that covers the torso and hangs down over the legs. A dress can be any one-piece garment containing a skirt of any length. Dresses can be formal or informal. In many cultures, dresses are more often worn by women and girls.The hemlines of dresses vary depending on the fashion of the time period and the modesty or personal taste of the wearer"
    },
    {
      'name': 'Heals',
      'image': 'images/santosImages/hills1.jpeg',
      'oldPrice': 1020,
      'price': 910,
    },
    {
      'name': 'Heals1',
      'image': 'images/santosImages/hills2.jpeg',
      'oldPrice': 1020,
      'price': 910,
    },
    // {
    //   'name': 'Dress',
    //   'image': 'images/santosImages/dress1.jpeg',
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
            child: Material(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              productDetailsName: _products[i]['name'],
                              productDetailsImage: _products[i]['image'],
                              productDetailsoldPrice: _products[i]
                                  ['oldPrice'],
                              productDetailsPrice: _products[i]['price'],
                              productDetailsDesc: _products[i]['prodDesc'],
                            ),
                      ),
                    ),
                child: GridTile(
                  child: Image.asset(
                    _products[i]['image'],
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
                            "${_products[i]['name']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "₹ ${_products[i]['price']}",
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
