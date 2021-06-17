import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'BaseCommonWidget.dart';
import 'HomePage.dart';
import 'MyApp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseCommonWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, password;
  bool _passwordVisible = false, _isLoading = false;

  void initState() {
    _passwordVisible = false;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(top: 65.0),
                  child: Center(
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 19,
                  bottom: 24,
                  right: screenWidth * .15,
                  left: screenWidth * .15,
                ),
                child: Center(
                  child: getDynamicText("Welcome.!!",
                      textColor: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * .15,
                  right: screenWidth * .15,
                ),
                child: Container(
                  height: screenHeight * .55,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                        20,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 28,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 18,
                            ),
                            child: getDynamicText("Sign In",
                                fontSize: 26, fontWeight: FontWeight.w500),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 6,
                              right: 6,
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 16),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              validator: (value) {
                                bool emailValid = RegExp(
                                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(value);
                                if (value.isEmpty ||
                                    value.length < 4 ||
                                    !emailValid) {
                                  return "Please Enter correct email";
                                }
                                return null;
                              },
                            ),
                          ),
                          // Third form field
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 6,
                              right: 6,
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    child: Icon(!_passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                hintText: "Enter your password",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 16),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return "Password should be 6 character or long";
                                }
                                return null;
                              },
                            ),
                          ),
                          // Forgot password
                          GestureDetector(
                            onTap: () {
                              print("forgot my password");
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 12,
                                right: 6,
                              ),
                              child: Container(
                                child: getDynamicText("Forgot Password?",
                                    fontSize: 14, fontWeight: FontWeight.w400),
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ),

                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: _isLoading
                                      ? SpinKitDoubleBounce(
                                          color: Colors.deepPurple)
                                      : Icon(
                                          Icons.arrow_forward,
                                          color: Colors.blue,
                                        ),
                                ),
                              ),
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      new MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                      (route) => false);
                                  setState(() {
                                    _isLoading = true;
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
