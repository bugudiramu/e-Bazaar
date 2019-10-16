import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool liked = false;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("Favorites"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('favorites').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      "${document.data['image']}",
                    ),
                    title: Text("${document.data['name']}"),
                    subtitle: Text("₹ ${document.data['price']}"),
                    trailing: IconButton(
                      color: liked ? Colors.grey : Colors.red,
                      icon: liked
                          ? Icon(
                              Icons.favorite_border,
                            )
                          : Icon(Icons.favorite),
                      onPressed: () async {
                        setState(() {
                          // liked = !liked;
                          Firestore.instance
                              .collection("favorites")
                              .document(document.documentID)
                              .delete();
                        });
                        // _key.currentState.showSnackBar(
                        //   SnackBar(
                        //     content: Text("Removed From Favorite"),
                        //   ),
                        // );
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
    );
  }
}
