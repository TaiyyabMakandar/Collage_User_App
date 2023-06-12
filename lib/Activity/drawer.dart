import 'package:collageuser/Activity/aboutus.dart';
import 'package:collageuser/Activity/colwebsite.dart';
import 'package:collageuser/Activity/home.dart';
import 'package:collageuser/Activity/notice.dart';
import 'package:collageuser/Activity/retriveimagefromdb.dart';
import 'package:collageuser/Activity/splachscreen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
           // color: Color.fromRGBO(72, 0, 207, 0.635),
           color: Color.fromARGB(255, 117, 2, 98),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/logo.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Miraj Mahavidyalaya, Miraj',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'mirajmahavidyalaya@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
           leading: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset('images/home.png'),
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset('images/noticeboard.png'),
            ),
            title: Text(
              'Notice',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UploadedNotice()));
            },
          ),
          ListTile(
            leading: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset('images/gallery.png'),
            ),
            title: Text(
              'Images',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RetrivingImageFromDb()));
            },
          ),
          ListTile(
            leading: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset('images/team.png'),
            ),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Aboutus()));
            },
          ),
           ListTile(
            leading: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset('images/web.png'),
            ),
            title: Text(
              'Collage Website',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ColWebsite()));
            },
          ),
        ],
      ),
    );
  }
}
