import 'package:flutter/material.dart';

class CategoryImages extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 12.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100.0,
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
