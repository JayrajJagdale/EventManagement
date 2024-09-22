import 'package:event_management/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: const [
              WelcomeScreen(),
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 4,
                  effect: const ScaleEffect(
                    dotHeight: 6.0,
                    dotWidth: 6.0,
                    activeDotColor: Colors.deepPurple,
                    dotColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color:  Color.fromARGB(255,50, 174, 238),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Welcome to",
                  style: TextStyle(
                      fontFamily: "Oswald", fontSize: 36, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Event Hub!",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width:500,
                height: 470,
                decoration:  BoxDecoration(
                  color:  Color.fromARGB(255,50, 174, 238),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Page_Main.jpeg'),
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

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 317,
                  height: 364,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/S1.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 317,
                padding: const EdgeInsets.only(left: 2),
                child: const Text(
                  "Define Your Event :",
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: 25, color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 317,
                padding: const EdgeInsets.only(left: 2),
                child: const Text(
                  "Determine the purpose and goals of your event, It is a seminar, a workshop, a party, something else? Who is your target audience!!",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: "Oswald",
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                height: 52,
                width: 229,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                  color: Colors.blueAccent.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Nearly There",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: Colors.white,
                          ),
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
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 317,
                  height: 364,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage('assets/images/S2.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 317,
                padding: const EdgeInsets.only(left: 2),
                child: const Text(
                  "Select a Venue :",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 317,
                padding: const EdgeInsets.only(left: 2),
                child: const Text(
                  "Find a suitable college for your event,\nConsider factors like location, Students, and faculties for the event!!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontFamily: "Oswald"),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                height: 52,
                width: 229,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                  color: Colors.blueAccent.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Almost There",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: Colors.white,
                          ),
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
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.lightBlue,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 317,
                  height: 364,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage('assets/images/S3.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 317,
                padding: const EdgeInsets.only(left: 2),
                child: const Text(
                  "Select a Time :",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 317,
                padding: const EdgeInsets.only(left: 2),
                child: const Text(
                  "Set a Date and Time. Choose a perfect date and time that works for your target students and colleges!!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontFamily: "Oswald"),
                ),
              ),
              const SizedBox(height: 35),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => sign_up()), // Replace with your desired screen
              );
            },
              child: Container(
                height: 52,
                width: 229,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                  color: Colors.blueAccent.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: Colors.white,
                          ),
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