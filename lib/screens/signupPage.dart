import 'package:flutter/material.dart';
import 'package:shopping_cart/firebaseDB/googleSignIn.dart';
import 'package:shopping_cart/screens/loginPage.dart';
import 'package:shopping_cart/ui/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_cart/firebaseDB/userManagement.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
// Google sign in
  Auth auth = Auth();
// Google sign in

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserManagement userManagement = UserManagement();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  bool hidePass = true;
  SharedPreferences preferences;
  bool isLoading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      isLoading = false;
    });
  }

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
              Colors.red[400],
              Colors.red[100],
              Colors.teal[100],
              Colors.teal[400],
            ],
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              InkWell(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
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
                child: Text(
                  "Welcome Back. I am Very Much Excited About Your Next Shopping",
                  style: TextStyle(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        "Go to Login",
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervised_user_circle,
                            color: Colors.blueGrey),
                        hintText: "Username",
                        labelText: "Username",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please Provide Username";
                        }
                        // return "";
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email,
                              color: Colors.blueGrey),
                          hintText: "Email",
                          labelStyle: TextStyle(
                              // color: Colors.white,
                              ),
                          labelText: "Email"),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please Provide Email";
                        }
                        // return "";
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
                      obscureText: hidePass,
                      decoration: InputDecoration(
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
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blueGrey,
                          ),
                          hintText: "Password",
                          labelText: "Password"),
                      validator: (val) {
                        if (val.length < 6) {
                          return "Passsword must contain atleast 6 characters";
                        }
                        // return "";
                      },
                      onSaved: (val) {
                        _passwordController.text = val;
                      },
                      autocorrect: true,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: hidePass,
                      decoration: InputDecoration(
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
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blueGrey,
                          ),
                          hintText: "Confirm Password",
                          labelText: "Confirm Password"),
                      validator: (val) {
                        if (val.length < 6) {
                          return "Passsword must contain atleast 6 characters";
                        } else if (val.isEmpty) {
                          return "Password field can't be empty";
                        } else if (_passwordController.text != val) {
                          return "Password and Confirm Password didn't match";
                        }
                        // return "";
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
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      minWidth: MediaQuery.of(context).size.width,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            "Signup For Free",
                            style: _btnStyle(),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        signUpUser();
                      },
                      color: Color(0xFFB33771),
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

                    //  ================== Signin with Google Btn =======================

                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      minWidth: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Image.asset(
                          "images/google.png",
                          height: 30.0,
                        ),
                        title: Text(
                          "SignIn With Google",
                          style: _btnStyle(),
                        ),
                      ),
                      onPressed: () async {
                        _showLoadingIndicator();
                        FirebaseUser user = await auth.googleSignIn();
                        if (user != null) {
                          // user.sendEmailVerification();
                          userManagement.createUser(user.uid, {
                            "userId": user.uid,
                            "username": user.displayName,
                            "photoUrl": user.photoUrl,
                            "email": user.email,
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      },
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isLoading ?? true,
                child: Center(
                  child: CircularProgressIndicator(),
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
      fontSize: 18.0,
      letterSpacing: 0.8,
      color: Color(0xFFB33771),
    );
  }

  Future signUpUser() async {
    print("signUp");
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.reset();
      _showLoadingIndicator();
      FirebaseUser user = await firebaseAuth.currentUser();
      // FirebaseUser user;
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((user) {
          // user.sendEmailVerification();
          // here user.uid triggers an id inside the user which should match id of the user document
          userManagement.createUser(user.uid.toString(), {
            'userId': user.uid,
            'username': _nameController.text.toString(),
            'email': _emailController.text,
          }).CatchError((e) {
            print(e.toString());
          });
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }

  _showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 20.0,
              ),
              Text("Loading!")
            ],
          ),
        );
      },
    );
  }
}
