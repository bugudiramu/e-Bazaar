import 'package:flutter/material.dart';

class CategoryImages extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 12.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            child: _showImageCategory('images/cats/accessories.png', "Jewel"),
            onTap: () {},
          ),
          InkWell(
            child: _showImageCategory('images/cats/dress.png', "Dress"),
            onTap: () {},
          ),
          InkWell(
            child: _showImageCategory('images/cats/formal.png', "Formal"),
            onTap: () {},
          ),
          // InkWell(
          //   child: _showImageCategory('images/cats/informal.png', "InFormal"),
          //   onTap: () {},
          // ),
          InkWell(
            child: _showImageCategory('images/cats/jeans.png', "Jeans"),
            onTap: () {},
          ),
          InkWell(
            child: _showImageCategory('images/cats/shoe.png', "Shoe"),
            onTap: () {},
          ),
          InkWell(
            child: _showImageCategory('images/cats/tshirt.png', "T-Shirt"),
            onTap: () {},
          ),

          // _showImageCategory('images/cats/dress.png', "Dress"),
          // _showImageCategory('images/cats/formal.png', "Formal"),
          // // _showImageCategory('images/cats/informal.png', "Informal"),
          // _showImageCategory('images/cats/jeans.png', "Jeans"),
          // _showImageCategory('images/cats/shoe.png', "Shoe"),
          // _showImageCategory('images/cats/tshirt.png', "T-Shirt"),

          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     width: 80.0,
          //     child: ListTile(
          //       title: Image.asset(
          //         'images/cats/accessories.png',
          //         // height: 100,
          //         // width: 100,
          //       ),
          //       subtitle: Container(
          //         child: Text(
          //           "Accessories",
          //           style: _textStyle,
          //         ),
          //         alignment: Alignment.topCenter,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     width: 80.0,
          //     child: ListTile(
          //       title: Image.asset(
          //         'images/cats/dress.png',
          //         // height: 100,
          //         // width: 100,
          //       ),
          //       subtitle: Container(
          //         child: Text(
          //           "Dress",
          //           style: _textStyle,
          //         ),
          //         alignment: Alignment.topCenter,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     width: 80.0,
          //     child: ListTile(
          //       title: Image.asset(
          //         'images/cats/formal.png',
          //         // height: 100,
          //         // width: 100,
          //       ),
          //       subtitle: Container(
          //         child: Text(
          //           "Formal",
          //           style: _textStyle,
          //         ),
          //         alignment: Alignment.topCenter,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     width: 80.0,
          //     child: ListTile(
          //       title: Image.asset(
          //         'images/cats/informal.png',
          //         // height: 100,
          //         // width: 100,
          //       ),
          //       subtitle: Container(
          //         child: Text(
          //           "Informal",
          //           style: _textStyle,
          //         ),
          //         alignment: Alignment.topCenter,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     width: 80.0,
          //     child: ListTile(
          //       title: Image.asset(
          //         'images/cats/jeans.png',
          //       ),
          //       subtitle: Container(
          //         child: Text(
          //           "Jeans",
          //           style: _textStyle,
          //         ),
          //         alignment: Alignment.topCenter,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     width: 80.0,
          //     child: ListTile(
          //       title: Image.asset(
          //         'images/cats/shoe.png',
          //         // height: 100,
          //         // width: 100,
          //       ),
          //       subtitle: Container(
          //         child: Text(
          //           "Shoe",
          //           style: _textStyle,
          //         ),
          //         alignment: Alignment.topCenter,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     width: 80.0,
          //     child: ListTile(
          //       title: Image.asset(
          //         'images/cats/tshirt.png',
          //         // height: 100,
          //         // width: 100,
          //       ),
          //       subtitle: Container(
          //         child: Text(
          //           "T-shirt",
          //           style: _textStyle,
          //         ),
          //         alignment: Alignment.topCenter,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _showImageCategory(dynamic i, String text) {
    return Container(
      width: 80.0,
      child: ListTile(
        title: Image.asset(
          i,
        ),
        subtitle: Container(
          child: Text(
            text,
            style: _textStyle,
          ),
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
