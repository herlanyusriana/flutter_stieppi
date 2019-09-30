
import 'package:flutter/material.dart';
import 'package:flutter_app/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.auth, this.userId, this.onSignedOut})
  : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

 
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = Auth().getCurrentUser();
  var name , email , uid;


   _signOut() async {
      await FirebaseAuth.instance.signOut();
       {
      return Navigator.of(context).pushNamedAndRemoveUntil('/root', (Route<dynamic> route)=> false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final body = Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blueAccent,Colors.lightBlueAccent]
            )
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                Text(
                  ("Mahasiswa"),
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontFamily: "Roboto-Regular",
                  ),
                ),
                Text(
                  'User ID',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: "Roboto-Regular",
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(color: Colors.white,),
                ),
                GestureDetector(
                  child: Card(
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                        Icons.account_balance_wallet,
                        color: Colors.lightBlueAccent,
                      ),
                      title: Text(
                        'Saldoku',
                        style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 20.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
            GestureDetector(
                  child: Card(
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                        Icons.monetization_on,
                        color: Colors.lightBlueAccent,
                      ),
                      title: Text(
                        'Pembayaran',
                        style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 20.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Scaffold.of(context).showSnackBar(
                       SnackBar(
                         duration: const Duration(seconds: 1),
                         content: Text('Coming soon :)'),
                       )
                       );
                  },
                  child: Card(
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.help,
                        color: Colors.lightBlueAccent,
                      ),
                      title: Text(
                        'Bantuan',
                        style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 20.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _signOut,
                  child: Card(
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.lightBlueAccent,
                      ),
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 20.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));

    return IndexedStack(
      children: <Widget>[
        body
      ],
    );
  }
}
