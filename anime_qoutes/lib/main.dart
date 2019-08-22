import 'package:flutter/material.dart';
import './bottom_navy_bar.dart';
import './splashscreen.dart';
import './HomeScreen.dart';
import './Favourites.dart';
import './Editors.dart';
import './Settings.dart';


void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      )
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin  {
  int currentIndex = 0;
  TabController _controller;
  List<Widget> pages = [
    HomeScreen(),
    Favourites(),
    Editors(),
    Settings()
  ];

  @override
  void initState()
  {
   // new AnimatedSplashScreen();
    super.initState();
    _controller = TabController(
        vsync: this,
        length: pages.length,
        initialIndex: currentIndex
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: TabBarView(
          controller: _controller,
          children: pages.toList(),
        ),
        appBar: AppBar(
          elevation: 1,
          title: Text("Anime Quote"),
          backgroundColor: Colors.yellow,
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.black,
          selectedIndex: currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
            _controller.animateTo(currentIndex);
            setState(() {
              print(index);
            });
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
      ),
    );
  }
}
