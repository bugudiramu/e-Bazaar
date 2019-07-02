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
      'image': 'images/products/blazer1.jpg',
      'oldPrice': 1200,
      'price': 900,
      'prodDesc':
          "A blazer is a type of jacket resembling a suit jacket, but cut more casually. A blazer is generally distinguished from a sport coat as a more formal garment and tailored from solid colour fabrics. Blazers often have naval-style metal buttons to reflect their origins as jackets worn by boating club members. A blazer's cloth is usually durable, as it is intended as outdoor wear. Blazers are often part of a uniform that denotes, for example, an airline's employees, pupils of a particular school, members of sports clubs, or sportsmen and women on a particular team.",
    },
    {
      'name': 'Red-Blazer',
      'image': 'images/products/blazer2.jpg',
      'oldPrice': 1200,
      'price': 900,
      'prodDesc':
          "A blazer is a type of jacket resembling a suit jacket, but cut more casually. A blazer is generally distinguished from a sport coat as a more formal garment and tailored from solid colour fabrics. Blazers often have naval-style metal buttons to reflect their origins as jackets worn by boating club members. A blazer's cloth is usually durable, as it is intended as outdoor wear. Blazers are often part of a uniform that denotes, for example, an airline's employees, pupils of a particular school, members of sports clubs, or sportsmen and women on a particular team.",
    },
    {
      'name': 'Dress',
      'image': 'images/products/dress1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          "A dress (also known as a frock or a gown) is a garment consisting of a skirt with an attached bodice (or a matching bodice giving the effect of a one-piece garment).[1] It consists of a top piece that covers the torso and hangs down over the legs. A dress can be any one-piece garment containing a skirt of any length. Dresses can be formal or informal. In many cultures, dresses are more often worn by women and girls.The hemlines of dresses vary depending on the fashion of the time period and the modesty or personal taste of the wearer"
    },
    {
      'name': 'White-Dress',
      'image': 'images/products/dress2.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          "A dress (also known as a frock or a gown) is a garment consisting of a skirt with an attached bodice (or a matching bodice giving the effect of a one-piece garment).[1] It consists of a top piece that covers the torso and hangs down over the legs. A dress can be any one-piece garment containing a skirt of any length. Dresses can be formal or informal. In many cultures, dresses are more often worn by women and girls.The hemlines of dresses vary depending on the fashion of the time period and the modesty or personal taste of the wearer"
    },
    {
      'name': 'Blue-Jeans',
      'image': 'images/products/jeans1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'Jean also references a (historic) type of sturdy cloth commonly made with a cotton warp and wool weft (also known as "Virginia cloth"). Jean cloth can be entirely cotton as well, similar to denim. Originally designed for cowboys and miners, modern jeans became popular in the 1950s among teenagers, especially members of the greaser subculture.'
    },
    {
      'name': 'Jeans',
      'image': 'images/products/jeans2.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'Jean also references a (historic) type of sturdy cloth commonly made with a cotton warp and wool weft (also known as "Virginia cloth"). Jean cloth can be entirely cotton as well, similar to denim. Originally designed for cowboys and miners, modern jeans became popular in the 1950s among teenagers, especially members of the greaser subculture.'
    },
    {
      'name': 'Green-T-Shirt',
      'image': 'images/products/tshirt1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'A T-shirt is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-shirts are generally made of a stretchy, light and inexpensive fabric and are easy to clean.'
    },
    {
      'name': 'T-Shirt',
      'image': 'images/products/tshirt2.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'A T-shirt is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-shirts are generally made of a stretchy, light and inexpensive fabric and are easy to clean.'
    },
    {
      'name': 'Skirt1',
      'image': 'images/products/skirt1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'A skirt can be a draped garment made out of a single piece of fabric (such as pareos), but most skirts are fitted to the body at the waist or hips and fuller below, with the fullness introduced by means of darts, gores, pleats, or panels. Modern skirts are usually made of light to mid-weight fabrics, such as denim, jersey, worsted, or poplin. Skirts of thin or clingy fabrics are often worn with slips to make the material of the skirt drape better and for modesty.'
    },
    {
      'name': 'Skirt2',
      'image': 'images/products/skirt2.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'A skirt can be a draped garment made out of a single piece of fabric (such as pareos), but most skirts are fitted to the body at the waist or hips and fuller below, with the fullness introduced by means of darts, gores, pleats, or panels. Modern skirts are usually made of light to mid-weight fabrics, such as denim, jersey, worsted, or poplin. Skirts of thin or clingy fabrics are often worn with slips to make the material of the skirt drape better and for modesty.'
    },
    {
      'name': 'Shoe1',
      'image': 'images/products/shoe1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'A shoe is an item of footwear intended to protect and comfort the human foot while the wearer is doing various activities. Shoes are also used as an item of decoration and fashion'
    },
    {
      'name': 'Shoe2',
      'image': 'images/products/shoe2.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'A shoe is an item of footwear intended to protect and comfort the human foot while the wearer is doing various activities. Shoes are also used as an item of decoration and fashion'
    },
    {
      'name': 'Heel1',
      'image': 'images/products/hills1.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'High heels are a type of shoe in which the heel, compared with the toe, is significantly higher off the ground. These shoes go beyond simply protecting the foot from the ground or improving efficiency of walking.'
    },
    {
      'name': 'Heel2',
      'image': 'images/products/hills2.jpg',
      'oldPrice': 888,
      'price': 200,
      'prodDesc':
          'High heels are a type of shoe in which the heel, compared with the toe, is significantly higher off the ground. These shoes go beyond simply protecting the foot from the ground or improving efficiency of walking.'
    },
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
                              productDetailsoldPrice: _products[i]['oldPrice'],
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
