import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Anime Qoutes',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  TabController _controller;

  List<String> pages = [
    'Home',
    'Favourites',
    'Editors',
    'Settings',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        vsync: this,
        length: pages.length,
        initialIndex: _index
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: pages.map((title) {
          return Center(
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 52),
            ),
          );
        }).toList(),
      ),
      appBar: AppBar(
        elevation: 1,
        title: Text("Anime Quote"),
        backgroundColor: Colors.yellow,
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        onItemSelected: (index) => setState(() {
          _index = index;
          _controller.animateTo(_index);
        }),
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.cyan,
              inactiveColor: Colors.white
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text('Favourites'),
              activeColor: Colors.green,
              inactiveColor: Colors.white
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Editors'),
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.white
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue,
              inactiveColor: Colors.white
          ),
        ],
      ),

    );
  }
}
