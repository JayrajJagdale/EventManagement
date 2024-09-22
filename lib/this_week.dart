import 'package:flutter/material.dart';

class thisweek extends StatefulWidget {
  const thisweek({super.key});

  @override
  State<thisweek> createState() => _thisweekState();
}

class _thisweekState extends State<thisweek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Home_Page.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "This Week Events",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Poppins",
                          color: Colors.black87),
                    ),
                  ),
                ),
                Divider(color: Colors.black87),
                ListTile(
                  leading: Image.asset("assets/images/full_stack.jpeg"),
                  title: Text(
                    "Full Stack Develpment",
                    style: TextStyle(fontFamily: "Poppins",fontSize: 20,),
                  ),
                  subtitle:
                      Text("Mon 10th April 2024\n Bharati Vidyapeeth Kolhapur",
                        style: TextStyle(fontFamily: "Oswald",fontSize: 15,),
                      ),
                ),
                Divider(color: Colors.black87,),
                ListTile(
                  leading: Image.asset("assets/images/solodance.jpeg"),
                  title: Text(
                    "Solo Dance",
                    style: TextStyle(fontFamily: "Poppins",fontSize: 20,),
                  ),
                  subtitle:
                      Text("Tue 13th April 2024\n GPKP Kolhapurr",
                        style: TextStyle(fontFamily: "Oswald",fontSize: 15,),
                      ),
                ),
                Divider(color: Colors.black87,),
                ListTile(
                  leading: Image.asset("assets/images/appdev.jpeg"),
                  title: Text(
                    "App Develpment",
                    style: TextStyle(fontFamily: "Poppins",fontSize: 20,),
                  ),
                  subtitle:
                      Text("Sat 11th April 2024\n Bharati Vidyapeeth Kolhapur",
                        style: TextStyle(fontFamily: "Oswald",fontSize: 15,),
                      ),
                ),
                Divider(color: Colors.black87),
              ],
            )));
  }
}
