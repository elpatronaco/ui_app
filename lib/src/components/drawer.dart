import 'package:flutter/material.dart';
import 'package:ui_app/src/pages/basico_page.dart';
import 'package:ui_app/src/pages/scroll_page.dart';
import 'package:ui_app/src/pages/parallax.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Text(
                  "Pau Colomé Diaz",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "paucolome10@gmail.com",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("assets/sds.jpg"), fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text('Básico Page'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BasicoPage()));
            },
          ),
          ListTile(
            title: Text('Scroll Page'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScrollPage()));
            },
          ),
          ListTile(
            title: Text('Parallax'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Parallax()));
            },
          ),
        ],
      ),
    );
  }
}
