import 'package:flutter/material.dart';
import 'participate_form.dart';

class otherevents extends StatefulWidget {
  const otherevents({super.key});

  @override
  State<otherevents> createState() => _othereventsState();
}

class _othereventsState extends State<otherevents> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Other Colleges Events",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Poppins",
                        color: Colors.black87),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage(
                        'assets/images/quizgame.jpeg',
                      ),
                      fit: BoxFit.fitWidth,
                    )),
                child: Container(
                  margin: EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      Text(
                        "Quiz Game",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        " Wen 15th November 2024 6pm to 10pm",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Oswald",
                            color: Colors.black87),
                      ),
                      Text(
                        " New Polytechnic Kolhapur",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Oswald",
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "RS 35",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.red,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Participate()));
                        },
                        child: Text(
                          "Participate",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          backgroundColor: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage(
                        'assets/images/solodance.jpeg',
                      ),
                      fit: BoxFit.fitWidth,
                    )),
                child: Container(
                  margin: EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      Text(
                        "Solo Dance",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        "   Tue 13th April 2024 6pm to 10pm",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Oswald",
                            color: Colors.black87),
                      ),
                      Text(
                        "GPKP Kolhapur",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Oswald",
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "RS 999",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.red,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Participate()));
                        },
                        child: Text(
                          "Participate",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          backgroundColor: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage(
                        'assets/images/hacking.jpg',
                      ),
                      fit: BoxFit.fitWidth,
                    )),
                child: Container(
                  margin: EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      Text(
                        "Hacking",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        "   Tue 15th November 2024 6pm to 10pm",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Oswald",
                            color: Colors.black87),
                      ),
                      Text(
                        "Walchand College Of Engineering, Sangali ",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Oswald",
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "RS 1999",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.red,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Participate()));
                        },
                        child: Text(
                          "Participate",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          backgroundColor: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
