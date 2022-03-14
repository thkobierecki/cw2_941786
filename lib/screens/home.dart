import 'package:flutter/material.dart';

//This is the about page, where the credits
//are mentioned.
//It also has a link to the URL from where the
//book that motivated this app was bought
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome to Yoga App",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ))),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 8.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: AssetImage('images/meditation.png'),
                      ),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select yoga program",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ))),
                Card(
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Text('Rishikesh Surya Namaskar'),
                      ),
                      Row(children: <Widget>[
                        const SizedBox(width: 15),
                        Wrap(
                            spacing: 8.0, // spacing between adjacent chips
                            runSpacing: 0.0,
                            children: [
                              Chip(
                                padding: EdgeInsets.only(
                                    top: 2, bottom: 2, left: 8, right: 8),
                                backgroundColor: Colors.teal[500],
                                shadowColor: Colors.black,
                                label: Text(
                                  'Basic',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Chip(
                                padding: EdgeInsets.only(
                                    top: 2, bottom: 2, left: 8, right: 8),
                                backgroundColor: Colors.teal[500],
                                shadowColor: Colors.black,
                                label: Text(
                                  '12 exercises',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ])
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                              child: const Text('START FLOW'),
                              onPressed: () {
                                // Navigate to the second screen using a named route.
                                Navigator.pushNamed(context, '/basic-flow');
                              }),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
