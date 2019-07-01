import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement {
//  Firestore firestore = Firestore.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  // here user.uid triggers an id inside the user which should match id of the user document
  createUser(String uid, Map value) {
    //  firestore.collection("users/$uid").add(value).catchError((e){
    //    print(e.toString());
    //  });

    database.reference().child("users/$uid").push().set(value).catchError((e) {
      print(e.toString());
    });
  }
}
