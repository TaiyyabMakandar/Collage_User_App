import 'dart:async';
import 'package:collageuser/Activity/home.dart';
import 'package:flutter/material.dart';

class splachScreen extends StatefulWidget {
  const splachScreen({Key? key}) : super(key: key);

  @override
  State<splachScreen> createState() => _splachScreenState();
}

class _splachScreenState extends State<splachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Yashwant Shikshan Sanstha',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                'Miraj Mahavidyalaya, Miraj',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                'mirajmahavidyalaya@gmail.com',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'images/newlogo.png',
                //   height: 350,
                //  width: 500,
              ),
              // SizedBox(
              //   height: 50,
              // ),
              // Text(
              //   'mirajmahavidyalaya@gmail.com',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 17,
              //       fontStyle: FontStyle.italic),
              // ),
              SizedBox(
                height: 5,
              ),
              Text(
                'BCA Department',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
