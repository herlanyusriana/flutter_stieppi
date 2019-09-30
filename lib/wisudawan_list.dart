import 'package:flutter/material.dart';

class WisudawanPage extends StatefulWidget {
  @override
  _WisudawanPageState createState() => _WisudawanPageState();
}

class _WisudawanPageState extends State<WisudawanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wisuda VII',
          style: TextStyle(fontFamily: 'SF-Pro-Display-Bold',fontSize: 20.0),
          
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8.0)
            ),
            child: ListTile(
              onTap: (){},
              title: Text('Wisudawan Manajemen'), 
              subtitle: Text('Wisudawan VIII'),
              leading: Icon(Icons.school),
            ) ,
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8.0)
            ),
            child: ListTile(
              title: Text('Wisudawan Akuntansi'), 
              subtitle: Text('Wisudawan VIII'),
              leading: Icon(Icons.school),
              onTap: (){},
            ) ,
          )
        ],
        
      ),
      
    );
  }
}