import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ColWebsite extends StatefulWidget {
  const ColWebsite({ Key? key }) : super(key: key);

  @override
  _ColWebsiteState createState() => _ColWebsiteState();
}

class _ColWebsiteState extends State<ColWebsite> {
  
@override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Collage Website")),
      
      body: WebView(
        
        initialUrl:'https://www.w3schools.com/',
        
      )
    );
  }
}