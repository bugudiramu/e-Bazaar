import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserManagement {
  Firestore firestore = Firestore.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  createUser(String uid, Map data) {
    database
        .reference()
        .child("users/$uid")
        .push()
        .set(data)
        .catchError((e) => print(e.toString()));
  }

  // here user.uid triggers an id inside the user which should match id of the user document
  // createUser(Map data) {
  //   firestore.collection("users").document(data["userId"]).setData(data);
  // }
}
