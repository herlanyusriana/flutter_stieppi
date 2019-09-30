import 'package:flutter/material.dart';
import 'package:flutter_app/authentication.dart';
import 'profile.dart';
import 'home.dart';
import 'broadcast.dart';  
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.auth, this.userId, this.onSignedOut})
  : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  PageController pageController;
  int _selectedIndex = 0;
  static  List<Widget> _widgetoptions = <Widget> [
    Home(),
    Broadcast(),
    Profile(),
  ];
  final widgetoption = _widgetoptions;


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: _selectedIndex,
          children: _widgetoptions
      ),

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blueAccent,), title: Text('Home'), backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.video_library,color: Colors.blueAccent,), title: Text('Broadcast', style: TextStyle(color: Colors.blueAccent),), backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.account_box,color: Colors.blueAccent,), title: Text('User',style: TextStyle(color: Colors.blueAccent),), backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
      ),



    );
  }
}