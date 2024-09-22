import 'package:event_management/home_page.dart';
import 'package:event_management/sign_in.dart';
import 'package:flutter/material.dart';
import 'firebase_auth.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  var username = TextEditingController();
  var pnumber = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  final AuthServices _authServices = AuthServices();
  String? _errorMessage;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    username.dispose();
    pnumber.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Sign_up.jpeg"),
            opacity: 1000,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 340,
                  height: 380,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: EdgeInsets.only(top: 30),
                            width: 300,
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w800,
                              ),
                              controller: username,
                              decoration: InputDecoration(
                                label: Text("Username"),
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlueAccent,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.person, color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 300,
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w800,
                              ),
                              controller: pnumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: Text("Phone Number"),
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlueAccent,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.phone, color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                } else if (value.length != 10) {
                                  return 'Phone number must be 10 digits';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 300,
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w800,
                              ),
                              controller: email,
                              decoration: InputDecoration(
                                label: Text("Email"),
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlueAccent,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 300,
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w800,
                              ),
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                label: Text("Password"),
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlueAccent,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.password_outlined, color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.2),
                  height: 160,
                  width: 700,
                  child: Column(
                    children: [
                      if (_errorMessage != null && _errorMessage!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 8,
                            ),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.all(14.0),
                        width: 233,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await _authServices.signup(
                                  email: email.text,
                                  password: password.text,
                                );

                                // Show success SnackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Signed up successfully!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );

                                // Navigate to the home page after a delay
                                await Future.delayed(const Duration(seconds: 2));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => home_page()),
                                );
                              } catch (e) {
                                setState(() {
                                  _errorMessage = e.toString();
                                });
                              }
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                      Text(
                        "----------------------- OR ----------------------- ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 12),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => sign_in()));
                              },
                              child: Text(
                                "Sign In ?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontFamily: "Poppins"),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
