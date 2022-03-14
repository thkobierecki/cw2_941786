import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//This is the about page, where the credits
//are mentioned.
//It also has a link to the URL from where the
//book that motivated this app was bought
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static const aboutYoga =
      "Sun Salutations or Surya Namaskar is a yoga-based exercise for overall personality development. It is a unique exercise, which gives benefits to both the gross and the subtle bodies of a human being.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Image(
                    image: AssetImage('images/about-img.png'),
                    height: 250,
                  ),
                  Card(
                    margin: EdgeInsets.all(5.0),
                    color: Colors.teal[300],
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text("About  App",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ))
                              ],
                            ),
                            Row(
                              children: [Flexible(child: Text(aboutYoga))],
                            ),
                          ],
                        )),
                  ),
                  Row(children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text("Created by",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          )),
                                      Text("Tomasz Kobierecki",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ))
                                    ],
                                  )),
                              color: Colors.teal[200],
                            ))),
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Card(
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text("Student number: ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        )),
                                    Text("941786",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ))
                                  ],
                                )),
                            color: Colors.teal[200],
                          )),
                    )
                  ]),
                  Row(children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text("Student email: ",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          )),
                                      Text("941786@swansea.ac.uk",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ))
                                    ],
                                  )),
                              color: Colors.teal[200],
                            ))),
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Card(
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text("Source code url: ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        )),
                                    InkWell(
                                      child: Text("github.com/tkobierecki",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.blueAccent,
                                          )),
                                      onTap: () => launchURL('github.com'),
                                    )
                                  ],
                                )),
                            color: Colors.teal[200],
                          )),
                    )
                  ]),
                  Row(children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text("Ilustrations source: ",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          )),
                                      InkWell(
                                        child: Text("Undraw Ilustrations",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.blueAccent,
                                            )),
                                        onTap: () => launchURL(
                                            'https://undraw.co/illustrations'),
                                      )
                                    ],
                                  )),
                              color: Colors.teal[200],
                            ))),
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Card(
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text("Poses images source: ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        )),
                                    InkWell(
                                      child: Text(" wikihow.com",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.blueAccent,
                                          )),
                                      onTap: () => launchURL(
                                          'https://www.wikihow.com/Perform-Surya-Namaskar'),
                                    )
                                  ],
                                )),
                            color: Colors.teal[200],
                          )),
                    )
                  ]),
                ]))));
  }
}
