import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              alignment: Alignment.topLeft,
              child: Text(
                "Questions about an issue?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text("Feel free to Ask!"),
            SizedBox(height: 50.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _launchTwitter();
                    },
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/twitter.png',
                        height: 70.0,
                        width: 70.0,
                      ),
                      subtitle: Center(
                        child: Text(
                          "Twitter",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _launchgithub();
                    },
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/github.png',
                        height: 70.0,
                        width: 70.0,
                      ),
                      subtitle: Center(
                        child: Text(
                          "Github",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _launchlinkedIn();
                    },
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/linkedin.png',
                        height: 70.0,
                        width: 70.0,
                      ),
                      subtitle: Center(
                        child: Text(
                          "LinkedIn",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text("OR Email me at :"),
                  Text("ramubugudi4@gmail.com",
                      style: TextStyle(color: Colors.blueGrey))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchTwitter() async {
    const url = 'https://twitter.com/_iamramu';
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchgithub() async {
    const url = 'https://github.com/bugudiramu';
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchlinkedIn() async {
    const url = 'https://www.linkedin.com/in/bugudi-ramu-2a5a5a161/';
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
