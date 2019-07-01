// ========================== LoginPage ===============================

import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/signupPage.dart';
import 'package:shopping_cart/ui/homepage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  // bool isLoggedIn = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // SharedPreferences preferences;
  bool loading = false;
  bool hidePass = true;
  // bool isLogedin = false;

  // @override
  // void initState() {
  //   super.initState();
  //   isSignedIn();
  // }

  // void isSignedIn() async {
  //   setState(() {
  //     loading = true;
  //   });

  //   await _firebaseAuth.currentUser().then((user) {
  //     if (user != null) {
  //       setState(() => isLogedin = true);
  //     }
  //   });
  //   if (isLogedin) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }

  //   setState(() {
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            // stops: [0.1, 0.5, 0.6, 0.5],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.teal[100],
              Colors.teal[200],
              Colors.teal[300],
              Colors.teal[400],
            ],
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                alignment: Alignment.center,
                child: Text(
                  "e-Bazaar",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                // alignment: Alignment.center,
                child: Text(
                  "Welcome Back. We Are Very Much Excited About Your Next Shopping",
                  style: TextStyle(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      "Login",
                      style: _loginRegStyles(),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: _loginRegStyles(),
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    TextFormField(

                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon:
                              Icon(Icons.alternate_email, color: Colors.blueGrey),
                          hintText: "Email",
                          labelStyle: TextStyle(
                              // color: Colors.white,
                              ),
                          labelText: "Email"),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please Provide Email";
                        }
                      },
                      onSaved: (val) {
                        _emailController.text = val;
                      },
                      autocorrect: true,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      // obscureText:hidepass we toggle when user clicks the icon
                      obscureText: hidePass,
                      decoration: InputDecoration(

                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blueGrey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.blueGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePass = false;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.black),

                          ),
                          hintText: "Password",
                          labelText: "Password"),
                      validator: (val) {
                        if (val.length < 6) {
                          return "Passsword must contain atleast 6 characters";
                        }else if(val.isEmpty){
                          return "Password field can't be empty";
                        }
                      },
                      onSaved: (val) {
                        _passwordController.text = val;
                      },
                      autocorrect: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //  ================== Login Btn =======================
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            "Login",
                            style: _btnStyle(),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      color: Color(0xFFB33771),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFFB33771),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text("OR"),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    //  ==================start: Login with Facebook Btn =======================
                    // MaterialButton(
                    //   minWidth: MediaQuery.of(context).size.width,
                    //   child: ListTile(
                    //       leading: Image.asset(
                    //         "images/facebook.png",
                    //         height: 30.0,
                    //       ),
                    //       title: Text(
                    //         "Login With Facebook",
                    //         style: _btnStyle(),
                    //       )),
                    //   onPressed: () {},
                    //   color: Colors.blue,
                    // ),
                    //  ==================end: Login with Facebook Btn =======================

                    //  ==================start: Login as Guest Btn Btn =======================
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            "Login As Guest",
                            style: _btnStyle(),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
//  ==================end: Login as Guest Btn =======================
                    Visibility(
                      visible: isLoading ?? true,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ),
                    ),
//  ==================start: Login with Google Btn =======================

                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Image.asset(
                          "images/google.png",
                          height: 30.0,
                        ),
                        title: Text(
                          "Login With Google",
                          style: _btnStyle(),
                        ),
                      ),
                      onPressed: () {},
                      color: Colors.redAccent,
                    ),
                    //  ==================end: Login with Google Btn =======================
                  ],
                ),
              ),
            ],
          ),
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

  TextStyle _loginRegStyles() {
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16.0,
      letterSpacing: 0.8,
      decoration: TextDecoration.underline,
    );
  }
}

// =======================Start: SignInWithGoogle ============================

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shopping_cart/ui/homepage.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences preferences;
//   bool isLoading = false;
//   bool isLoggedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     isSignedIn();
//   }

//   void isSignedIn() async {
//     setState(() {
//       isLoading = true;
//     });
//     preferences = await SharedPreferences.getInstance();
//     isLoggedIn = await _googleSignIn.isSignedIn();
//     if (isLoggedIn) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }

//   Future handleSignIn() async {
//     preferences = await SharedPreferences.getInstance();
//     setState(() {
//       isLoading = true;
//     });
//     GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );
//     final FirebaseUser firebaseUser =
//         await _firebaseAuth.signInWithCredential(credential);
//     print("signed in " + firebaseUser.displayName);

//     if (firebaseUser != null) {
//       final QuerySnapshot result = await Firestore.instance
//           .collection("users")
//           .where("id", isEqualTo: firebaseUser.uid)
//           .getDocuments();
//       final List<DocumentSnapshot> documents = result.documents;
//       if (documents.length == 0) {
//         // Insert the user to our collection
//         Firestore.instance
//             .collection("users")
//             .document(firebaseUser.uid)
//             .setData({
//           'id': firebaseUser.uid,
//           'username': firebaseUser.displayName,
//           'photoUrl': firebaseUser.photoUrl,
//         });
//         await preferences.setString("id", firebaseUser.uid);
//         await preferences.setString("username", firebaseUser.displayName);
//         await preferences.setString("photoUrl", firebaseUser.displayName);
//       }
//       await preferences.setString("id", documents[0]['id']);
//       await preferences.setString("username", documents[0]['username']);
//       await preferences.setString("photoUrl", documents[0]['photoUrl']);
//     }
//     Fluttertoast.showToast(msg: "Login Successful:");
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FlatButton(
//           onPressed: () => handleSignIn(),
//           child: Text("SignInWithGoogle"),
//         ),
//       ),
//     );
//   }
// }

// =======================End: SignInWithGoogle ============================
