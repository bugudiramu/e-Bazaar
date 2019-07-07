import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseUser currentUser;
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    firebaseAuth.currentUser().then((FirebaseUser user) {
      setState(() {
        // call setState to rebuild the view
        this.currentUser = user;
      });
    });
  }

  String email() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "Guest User";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "If you want to reset your password click the button",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20.0),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0)),
                color: Color(0xFFB33771),
                minWidth: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: Center(
                    child: Text(
                      "Reset Password",
                      style: _btnStyle(),
                    ),
                  ),
                ),
                onPressed: () async {
                  await firebaseAuth.sendPasswordResetEmail(email: email());
                  passwordResetDialog();
                }),
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

  void passwordResetDialog() {
    var alert = AlertDialog(
      content: Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(
            "Password Reset Link Has Been Sent To Your EmailID: ${email()}"),
      ),
    );
    showDialog(context: context, builder: (_) => alert);
  }
}
