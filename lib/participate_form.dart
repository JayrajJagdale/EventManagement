import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Participate extends StatefulWidget {
  const Participate({super.key});

  @override
  State<Participate> createState() => _ParticipateState();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: Participate()));
}

class _ParticipateState extends State<Participate> {
  final Fname = TextEditingController();
  final Lname = TextEditingController();
  final Gmail = TextEditingController();
  final Contact = TextEditingController();
  final College = TextEditingController();
  final Year = TextEditingController();
  final Branch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      labelStyle: const TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue), // Change to blue
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue), // Change to blue
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue), // Change to blue
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Home_Page.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Form Card
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: Colors.red),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Participation Form",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Form Fields
                    Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                          keyboardType: TextInputType.name,
                          controller: Fname,
                          decoration: inputDecoration.copyWith(labelText: "FIRST NAME:"),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                          keyboardType: TextInputType.name,
                          controller: Lname,
                          decoration: inputDecoration.copyWith(labelText: "LAST NAME:"),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                          keyboardType: TextInputType.emailAddress,
                          controller: Gmail,
                          decoration: inputDecoration.copyWith(labelText: "GMAIL:"),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                          keyboardType: TextInputType.phone,
                          controller: Contact,
                          decoration: inputDecoration.copyWith(labelText: "CONTACT:"),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                          keyboardType: TextInputType.text,
                          controller: College,
                          decoration: inputDecoration.copyWith(labelText: "COLLEGE:"),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                          keyboardType: TextInputType.number,
                          controller: Year,
                          decoration: inputDecoration.copyWith(labelText: "YEAR:"),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                          keyboardType: TextInputType.text,
                          controller: Branch,
                          decoration: inputDecoration.copyWith(labelText: "BRANCH:"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Submit Button
                    ElevatedButton(
                      onPressed: () async {
                        CollectionReference collRef = FirebaseFirestore.instance.collection('client');
                        await collRef.add({
                          'Fname': Fname.text,
                          'Lname': Lname.text,
                          'Gmail': Gmail.text,
                          'Contact': Contact.text,
                          'College': College.text,
                          'Year': Year.text,
                          'Branch': Branch.text,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Form submitted successfully!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        await Future.delayed(const Duration(seconds: 2));
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontFamily: "Oswald",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Payment Buttons
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 15,
                      runSpacing: 10,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Credit Card Payment
                          },
                          icon: const Icon(Icons.credit_card),
                          label: const Text("Credit Card"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle PayPal Payment
                          },
                          icon: const Icon(Icons.payment),
                          label: const Text("PayPal"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Google Pay Payment
                          },
                          icon: const Icon(Icons.account_balance_wallet),
                          label: const Text("Google Pay"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
