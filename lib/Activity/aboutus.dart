import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/dev.jpg'),
                  maxRadius: 70,
                  minRadius: 70,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "TAIYYAB A MAKANDAR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Software Developer",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.grey.withOpacity(0.3)),

                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/email.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Text(
                            'Email:-',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'taiyyabmakandar@gmail.com',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                      ],
                    ),
                  ],
                ),
                        ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
               Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.grey.withOpacity(0.3)),

                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/call.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Text(
                            'Phone No:-',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '0990090990',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                      ],
                    ),
                  ],
                ),
                        ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
               Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.grey.withOpacity(0.3)),

                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/location.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Text(
                            'Location:-',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'Miraj,Maharashtra',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                      ],
                    ),
                  ],
                ),
                        ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Design & Developed By",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "MD.Taiyyab A Makandar",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold, 
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











// SizedBox(
//                 height: 50,
//               ),
//               CircleAvatar(
//                 backgroundImage: AssetImage('three.png'),
//                 maxRadius: 70,
//                 minRadius: 70,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Icon(
//                 Icons.computer_outlined,
//                 size: 50,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "TAIYYAB A MAKANDAR",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 27,
//                     color: Colors.green,
//                     fontStyle: FontStyle.italic),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Software Developer",
//                 style: TextStyle(
//                   fontSize: 23,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 1.75,
//                 width: MediaQuery.of(context).size.width - 30.0,
//                 color: Colors.black.withOpacity(0.3),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Container(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width - 20.0,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(45),
//                           color: Colors.black.withOpacity(0.1)),
//                       padding: EdgeInsets.all(20),
//                       child: Text(
//                         "taiyyabmakandar@gmail.com",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width - 20.0,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(45),
//                           color: Colors.black.withOpacity(0.10)),
//                       padding: EdgeInsets.all(20),
//                       child: Text(
//                         "9999999999",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width - 20.0,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(45),
//                           color: Colors.black.withOpacity(0.1)),
//                       padding: EdgeInsets.all(20),
//                       child: Text(
//                         "Miraj, Maharashtra",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 80,
//               ),
//               Text(
//                 "Design & Developed By",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "MD.Taiyyab A Makandar",
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.italic,
//                   fontSize: 17,
//                 ),
//               )