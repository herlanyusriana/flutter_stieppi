import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/authentication.dart';
import 'package:flutter_app/profile.dart';
import 'package:flutter_app/root_page.dart';
import 'package:flutter_app/signup_page.dart';
import 'loginpage.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STIE PPI',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        
      ),
      home: SplashScreen(),
      routes: {'/splash': (context) => SplashScreen(),
      '/login': (context) => LoginSignUpPage(),
      '/profile' : (context) => Profile(),
      '/register' : (context) => RegisterPage(),
      '/Home' : (context) => MyHomePage(),
      '/root' : (context) => RootPage(),
      

      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
      Image image1;
      Image image2;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return RootPage(auth: new Auth(),);
    }));
  }
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/splash.jpg'), fit: BoxFit.cover
            )
          ),
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 300,
          ),
        CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
