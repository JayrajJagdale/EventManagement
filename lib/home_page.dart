import 'dart:io';

import 'package:event_management/other_events.dart';
import 'participate_form.dart';
import 'package:event_management/this_week.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'author1.dart';
import 'author2.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int myIndex = 0;
  List<Widget> widgetList = [
    home(),
    create(),
    contact(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(child: Text("Event Hub!",
          style: TextStyle(fontFamily: "Oswald", color: Colors.white),)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 41,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jayraj Jagdale',
                    style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Edit Profile"),
              leading: Icon(Icons.person),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Edit Profile'),
                      content: Text('Profile editing feature is coming soon!'),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text("Help Center"),
              leading: Icon(Icons.help_outline),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Help Center'),
                      content: Text('For help, please contact eventhub09@example.com'),
                      actions: [
                        TextButton(
                          child: Text('Contact'),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> contact()));
                          },
                        ),
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info_outlined),
              onTap: () {
                // Show about dialog
                showAboutDialog(
                  context: context,
                  applicationName: 'Event Hub',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2024 Jc Enterprise',
                  children: [
                    Text('This is a simple event management application'),
                  ],
                );
              },
            ),
            ListTile(
              title: Text("Exit"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Exit'),
                      content: Text('Are you sure you want to exit?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Exit'),
                          onPressed: () {
                              exit(0);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page_outlined), label: 'Contact'),
        ],
      ),
      body: widgetList[myIndex],
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/Home_Page.jpeg"),
    fit: BoxFit.cover,
    ),
    ),
    child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: [
    Align(
    alignment: Alignment.topLeft,
    child: Text(
    "Events",
    style: TextStyle(
    fontSize: 30,
    fontFamily: "Poppins",
    color: Colors.black87),
    ),
    ),
    SizedBox(
    height: 30,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    OutlinedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>home_page()));
    },
    child: Text(
    "Our Events",
    style: TextStyle(
    fontFamily: "Oswald", color: Colors.black87),
    ),
    style: OutlinedButton.styleFrom(
    side: BorderSide(
    color: Colors.indigoAccent,
    width: 1.5,
    )),
    ),
    SizedBox(width: 10,),
    OutlinedButton(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (
    context) => otherevents()));
    },
    child: Text(
    "Other Events",
    style: TextStyle(
    fontFamily: "Oswald", color: Colors.black87),
    ),
    style: OutlinedButton.styleFrom(
    side: BorderSide(
    color: Colors.indigoAccent,
    width: 1.5,
    )),
    ),
    SizedBox(width: 10,),
    OutlinedButton(
    onPressed: () {},
    child: Text(
    "My Events",
    style: TextStyle(
    fontFamily: "Oswald", color: Colors.black87),
    ),
    style: OutlinedButton.styleFrom(
    side: BorderSide(
    color: Colors.indigoAccent,
    width: 1.5,
    )),
    ),
    SizedBox(width: 10,),
    OutlinedButton(
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>
    thisweek()));
    },
    child: Text(
    "This Week",
    style: TextStyle(
    fontFamily: "Oswald", color: Colors.black87),
    ),
    style: OutlinedButton.styleFrom(
    side: BorderSide(
    color: Colors.indigoAccent,
    width: 1.5,
    )),
    ),
    ],
    ),
    ),
    SizedBox(
    height: 30,
    ),
    Align(
    alignment: Alignment.centerLeft,
    child: Text(
    "Recommended for you ",
    style: TextStyle(
    fontFamily: "Poppins",
    fontSize: 15,
    color: Colors.black87),
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Column(
    children: [
      CarouselSlider(
          items: [
            Container(
              height: 300.0,
              width: 300.0,
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 300.0,
              width: 300.0,
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 300.0,
              width: 300.0,
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 300.0,
              width: 300.0,
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 300.0,
              width: 300.0,
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/5.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      ],
          options: CarouselOptions(
            height: 300.0,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
      ),
    Divider(color: Colors.black87,thickness: 2,),
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
    'assets/images/full_stack.jpeg',
    ),
    fit: BoxFit.fitWidth,
    )),
    child: Container(
    margin: EdgeInsets.only(top: 250),
    child: Column(
    children: [
    Text(
    "Full Stack Development",
    style: TextStyle(
    fontSize: 20,
    fontFamily: "Poppins",
    color: Colors.black87),
    ),
    SizedBox(
    height: 9,
    ),
    Text(
    "   Mon 10th April 2024 6pm to 10pm",
    style: TextStyle(
    fontSize: 15,
    fontFamily: "Oswald",
    color: Colors.black87),
    ),
    Text(
    " Bharati Vidyapeeth KOlhapur",
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
    "RS 199",
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
    //1st Container End
    SizedBox(
    height: 40,
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
    'assets/images/UIUX.png',
    ),
    fit: BoxFit.fitWidth,
    )),
    child: Container(
    margin: EdgeInsets.only(top: 250),
    child: Column(
    children: [
    Text(
    "UI/ UX Development",
    style: TextStyle(
    fontSize: 20,
    fontFamily: "Poppins",
    color: Colors.black87),
    ),
    SizedBox(
    height: 9,
    ),
    Text(
    "   Mon 23th March 2024 6pm to 10pm",
    style: TextStyle(
    fontSize: 15,
    fontFamily: "Oswald",
    color: Colors.black87),
    ),
    Text(
    " Bharati Vidyapeeth Kolhapur",
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
    "RS 99",
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
    //2nd Container End
    SizedBox(height: 40,),
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
    'assets/images/appdev.jpeg',
    ),
    fit: BoxFit.fitWidth,
    )),
    child: Container(
    margin: EdgeInsets.only(top: 250),
    child: Column(
    children: [
    Text(
    "App Development",
    style: TextStyle(
    fontSize: 20,
    fontFamily: "Poppins",
    color: Colors.black87),
    ),
    SizedBox(
    height: 9,
    ),
    Text(
    "   Tue 11th April 2024 6pm to 10pm",
    style: TextStyle(
    fontSize: 15,
    fontFamily: "Oswald",
    color: Colors.black87),
    ),
    Text(
    " Bharati Vidyapeeth Kolhapur",
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
    "RS 399",
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
      );
  }
}

class create extends StatelessWidget {
  var Ename = TextEditingController();
  var date = TextEditingController();
  var Cname = TextEditingController();
  var location = TextEditingController();
  var Edetails = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/Home_Page.jpeg"),
    fit: BoxFit.cover,
    ),
    ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Align(
        alignment: Alignment.topCenter,
        child: Text(
          "Create Your Event",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Poppins",
            color: Colors.black87,
          ),
        ),
            ),
            SizedBox(height: 20),
            Container(
            width: 300,
            height: 700,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
            color: Colors.red,
            width: 2,
            ),
            ),
            child: Column(
            children: [
              Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/create_back.jpeg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload,size: 25,color: Colors.white,),
                    ElevatedButton(onPressed: (){
                    },
                        child: Text("Upload Image",style: TextStyle(fontFamily: "Oswald",fontSize: 12),
                        ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                      ),
                    ),

                  ],
                ),
              ),
            Container(
            margin: EdgeInsets.only(top: 50),
            width: 250,
            child: TextField(
            style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800,
            ),
            controller: Ename,
            decoration: InputDecoration(
            label: Text("Event Name",style: TextStyle(color:Colors.black87),),
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
            color: Colors.blue,
            width: 2,
            ),
            ),
            prefixIcon: Icon(Icons.drive_file_rename_outline, color: Colors.white),
            ),
            ),
            ),
            SizedBox(height: 20),
            Container(
            width: 250,
            child: TextField(
            style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800,
            ),
            controller: date,
            decoration: InputDecoration(
            label: Text("Start Date and Time",style: TextStyle(color:Colors.black87),),
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
            color: Colors.blue,
            width: 2,
            ),
            ),
            prefixIcon: Icon(Icons.date_range, color: Colors.white),
            ),
            ),
            ),
            SizedBox(height: 20),
            Container(
            width: 250,
            child: TextField(
            style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800,
            ),
            controller: Cname,
            decoration: InputDecoration(
            label: Text("College Name",style: TextStyle(color:Colors.black87),),
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
            color: Colors.blue,
            width: 2,
            ),
            ),
            prefixIcon: Icon(Icons.school_outlined, color: Colors.white),
            ),
            ),
            ),
            SizedBox(height: 20),
            Container(
            width: 250,
            child: TextField(
            style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800,
            ),
            controller: location,
            decoration: InputDecoration(
            label: Text("Location",style: TextStyle(color:Colors.black87),),
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
            color: Colors.blue,
            width: 2,
            ),
            ),
            prefixIcon: Icon(Icons.location_city, color: Colors.white),
            ),
            ),
            ),
        SizedBox(height: 20),
        Container(
          width: 250,
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w800,
            ),
            controller: Edetails,
            decoration: InputDecoration(
              label: Text("Details of Event",style: TextStyle(color:Colors.black87),),
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
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              prefixIcon: Icon(Icons.details, color: Colors.white),
            ),
          ),
        ),
            SizedBox(height: 20),
            ElevatedButton(
            onPressed: () {
            },
            child: Text(
            "Create Event",
            style: TextStyle(
            fontFamily: "Oswald",
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white,
            ),
            ),
            style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(200),
            backgroundColor: Colors.blue,
            shadowColor: Colors.white,
            side: BorderSide(
            color: Colors.white,
            width: 2,
            ),
            ),
            ),
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

class contact extends StatelessWidget {
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
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                    ),
                    decoration: InputDecoration(
                      label: Text(
                        "Your Name",
                        style: TextStyle(color: Colors.black87),
                      ),
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
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                    ),
                    decoration: InputDecoration(
                      label: Text(
                        "Your Email",
                        style: TextStyle(color: Colors.black87),
                      ),
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
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                    ),
                    decoration: InputDecoration(
                      label: Text(
                        "Your Message",
                        style: TextStyle(color: Colors.black87),
                      ),
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
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(Icons.message, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Gender",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      GenderSelection(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'eventhub09@gmail.com',
                          );
                          launchUrl(emailLaunchUri);
                        },
                        icon: Icon(Icons.mail, color: Colors.white, size: 15,),
                        label: Text('Mail',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(90),
                          backgroundColor: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Implement your send message functionality here
                        },
                        child: Text(
                          "Send Message",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(180),
                          backgroundColor: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          launchUrl(Uri.parse("tel://9860831168"));
                        },
                        icon: Icon(Icons.phone, color: Colors.white,size: 15),
                        label: Text('Call',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(90),
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
                SizedBox(height: 20,),
                Text(
                  "About Authors",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins'
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> Author1()));
                        },
                        icon: Icon(Icons.perm_identity, color: Colors.white,),
                        label: Text('Mr. Jayraj',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(180),
                          backgroundColor: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> Author2()));
                        },
                        icon: Icon(Icons.perm_identity, color: Colors.white,),
                        label: Text('Mr. Chaitanya',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(180),
                          backgroundColor: Colors.red,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('Male'),
          value: 'Male',
          groupValue: _selectedGender,
          onChanged: (String? value) {
            setState(() {
              _selectedGender = value;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Female'),
          value: 'Female',
          groupValue: _selectedGender,
          onChanged: (String? value) {
            setState(() {
              _selectedGender = value;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Other'),
          value: 'Other',
          groupValue: _selectedGender,
          onChanged: (String? value) {
            setState(() {
              _selectedGender = value;
            });
          },
        ),
      ],
    );
  }
}





