import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/wisudawan_list.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "https://elearningppi.herokuapp.com/";
  int _index = 0;
   final List<Widget> images = [
    SizedBox(
      height: 200,
      width: 380,
          child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: new Image.asset(
          'images/welcome2.jpeg',
          fit: BoxFit.fill,
        ),
      ),
    ),
    SizedBox(
      height: 200,
      width: 380,
          child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: new Image.asset(
          'images/welcome1.jpg',
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];
  Future<bool> _onBackPress() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Notice!'),
              content: Text('Yakin ingin keluar?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('NO'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Info Akademik',
          style: TextStyle(fontFamily: 'SF-Pro-Display-Bold', fontSize: 20.0, color: Colors.white),
        ), 
      ),
      body: WillPopScope(
        onWillPop: _onBackPress,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blueAccent, Colors.lightBlueAccent])),
              child: SingleChildScrollView(
                              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width, left: MediaQuery.of(context).size.width, top: 12.0),
                    ),
                    CarouselSlider(
                      items: images,
                      reverse: false,
                      initialPage: _index,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 900),
                      pauseAutoPlayOnTouch: Duration(seconds: 5),
                      aspectRatio: 16/9,
                      viewportFraction: 1.0,
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 300,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                     Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WisudawanPage(),
                          ));
                        },
                        leading: Icon(
                          Icons.school,
                        ),
                        title: Text(
                          'Wisudawan VIII',
                          style: TextStyle(
                            fontFamily: 'SF-Pro-Display-Bold',
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          'Click for more',
                          style: TextStyle(fontFamily: 'SF-Pro-Display-Bold'),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: ListTile(
                        onTap: (){
                          Scaffold.of(context).showSnackBar(
                         SnackBar(
                           duration: const Duration(seconds: 1),
                           content: Text('Coming soon :)'),
                         )
                         );
                        },
                        leading: Icon(
                          Icons.description,
                        ),
                        title: Text(
                          'About PPI',
                          style: TextStyle(
                            fontFamily: 'SF-Pro-Display-Bold',
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          'Click for more',
                          style: TextStyle(fontFamily: 'SF-Pro-Display-Bold'),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.calendar_today,
                        ),
                        title: Text(
                          'Calender Academic',
                          style: TextStyle(
                            fontFamily: 'SF-Pro-Display-Bold',
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          'Click for more',
                          style: TextStyle(fontFamily: 'SF-Pro-Display-Bold'),
                        ),
                        onTap: () {
                          Scaffold.of(context).showSnackBar(
                         SnackBar(
                           duration: const Duration(seconds: 1),
                           content: Text('Coming soon :)'),
                         )
                         );
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ),
      
    );
  }
}
