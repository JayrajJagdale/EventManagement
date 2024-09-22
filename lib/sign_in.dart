import 'package:event_management/home_page.dart';
import 'package:flutter/material.dart';
import 'firebase_auth.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  var email = TextEditingController();
  var pass = TextEditingController();
  final AuthServices _authServices = AuthServices();
  String? _errorMessage;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/non_techevent.jpg"),
            opacity: 1000,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 340,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.only(top: 50),
                          width: 300,
                          child: Form(
                            key: _formKey,
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
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        SingleChildScrollView(
                          child: Container(
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
                              controller: pass,
                              keyboardType: TextInputType.visiblePassword,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.2),
                  height: 400,
                  width: 700,
                  child: Column(
                    children: [
                      if (_errorMessage != null && _errorMessage!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontFamily: "Poppins",
                              fontSize: 14,
                            ),
                          ),
                        ),
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(50.0),
                          width: 233,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await _authServices.signIn(
                                    email: email.text,
                                    password: pass.text,
                                  );

                                  // Show success SnackBar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Signed in successfully!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );

                                  // Navigate to the home page after a delay
                                  await Future.delayed(const Duration(seconds: 2));
                                  Navigator.pushReplacement(
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
                              "Sign In",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "----------------------- OR ----------------------- ",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New User?",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => sign_in()),
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
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
