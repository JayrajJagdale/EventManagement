import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(
    MaterialApp(
      title: 'Author',
      color: Color.fromARGB(255, 103, 80, 164),
      home: Author2(),
      debugShowCheckedModeBanner: false,
    )
);

class Author2 extends StatelessWidget {
  const Author2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author',
          style: TextStyle(
            fontFamily: 'PlaywriteNGModern',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[850],
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/mi_selfie.jpg'),
                            radius: 50.0,
                          ),
                          Text(
                            'Chaitanya P. Nayak (CV)',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Computer Engineering Student at BVCOE (Diploma) |\nSkilled in Programming and IT Support |',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ]
                    )
                ),
                Divider(
                  height: 60.0,
                  color: Colors.grey[900],
                  indent: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Hi! I\'m a Computer Engineering student with a passion for coding and technology. I strive to write quick, correct, and unique code. My interests include Java, Assembly Programming, VB.Net, and data communication & computer networks. I\'m always eager to learn and innovate, and I enjoy tackling new challenges in the tech world!',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Divider(
                  height: 60.0,
                  color: Colors.grey[900],
                  indent: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: _sendingMails,
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                            ),
                            icon:  Icon(Icons.mail_outline)),
                        IconButton(
                            onPressed: _sendingSMS,
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                            ),
                            icon: Icon(Icons.call))
                      ],
                    ),
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
_sendingMails() async {
  var url1 = Uri.parse("mailto: chaitanyanayak09h@gmail.com");
  if (await canLaunchUrl(url1)) {
    await launchUrl(url1);
  } else {
    throw 'Could not Launch $url1 !!!';
  }
}

_sendingSMS() async {
  var url2 = Uri.parse("sms:8806455575");
  if(await canLaunchUrl(url2)) {
    await launchUrl(url2);
  } else {
    throw 'could not launch $url2';
  }
}
