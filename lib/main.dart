import 'package:cw2_941786/poses.dart';
import 'package:cw2_941786/screens/about.dart';
import 'package:cw2_941786/screens/basic_flow.dart';
import 'package:cw2_941786/screens/contact_us.dart';
import 'package:cw2_941786/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.teal[800],
        ),
        primaryColor: Colors.teal[800],
      ),
      home: const MyHomePage(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/basic-flow': (context) => BasicFlowPage(
              poseList: PoseList(),
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    AboutPage(),
    MainPage(),
    ContactPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Yoga App")),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Contact Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[800],
        selectedIconTheme: IconThemeData(color: Colors.teal[800], size: 36),
        onTap: _onItemTapped,
      ),
    );
  }
}
