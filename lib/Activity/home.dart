import 'package:carousel_slider/carousel_slider.dart';
import 'package:collageuser/Activity/aboutus.dart';
import 'package:collageuser/Activity/drawer.dart';
import 'package:collageuser/Activity/images.dart';
import 'package:collageuser/Activity/notice.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String disp = '';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List allImgs = [
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9x6tl7e6guR6Oco9QrzAAGOjR1yhzF7aTXQ&usqp=CAU',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFR-6h-aiKgWy21zIFyDBxC5COQnFrFzQHLw&usqp=CAU',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsXbqYj4RLzgJYy71X7nh9iqKZSuVrc5NUUQ&usqp=CAU',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuuDuU_3U4TlV8TnEX3ft30oZgf9653yq_rg&usqp=CAU'

    'http://miraj-mahavidyalaya.org/wp-content/uploads/mg1.jpg',
    'http://miraj-mahavidyalaya.org/wp-content/uploads/DSC081271.jpg',
    'http://miraj-mahavidyalaya.org/wp-content/uploads/DSC08113.jpg',
    'http://miraj-mahavidyalaya.org/wp-content/uploads/DSC08125.jpg'
  ];

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    // HomeWidget(),
    // Images(),
    UploadedNotice(),
    Aboutus(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<List> LoadImages() async {
    List<Map> files = [];
    final ListResult result =
        await FirebaseStorage.instance.ref().child('image').listAll();
    final List<Reference> allFiles = result.items;
    await Future.forEach(allFiles, (Reference file) async {
      final String fileUrl = await file.getDownloadURL();
      files.add({"url": fileUrl, "path": file.fullPath});
    });
    print(files);
    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miraj Mahavidyalaya'),
        backgroundColor: Color.fromARGB(255, 117, 2, 98),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 350.0,
                width: double.infinity,
              ),
              Container(
                height: 200.0,
                color: Colors.grey,
                child: CarouselSlider(
                  options: CarouselOptions(height: 200.0, autoPlay: true),
                  items: allImgs.map((img) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Image.network(
                            img,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                top: 150.0,
                left: 15.0,
                right: 15.0,
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 88.0,
                left: (MediaQuery.of(context).size.width / 2 - 59.0),
                child: Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: AssetImage(
                        'images/logo.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 225,
                left: (MediaQuery.of(context).size.width / 2) - 148.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Text(
                      'Yashwant Shikshan Sanstha',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      'Miraj Mahavidyalaya, Miraj',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23.0),
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
                      height: 10.0,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     FlatButton(
                    //       onPressed: () {},
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(7.0),
                    //       ),
                    //       color: Colors.orange,
                    //       child: Text(
                    //         'Message',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 15.0,
                    //             color: Colors.white),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 5.0,
                    //     ),
                    //     FlatButton(
                    //       onPressed: () {},
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(7.0),
                    //       ),
                    //       color: Colors.grey,
                    //       child: Text(
                    //         'Following',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 15.0,
                    //             color: Colors.white),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                // Text(
                //   'See All',
                //   style: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.grey,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: <Widget>[
              menuCard(
                'bananabananabananab\nananabananabananabananab\nananabananabananabanana\nbananabananabananab\nanana',
                'images/abouttwo.png',
              ),
              SizedBox(
                height: 15.0,
              ),
              // menuCard(
              //   'bananabananabananab\nananabananabananabananab\nananabananabananabanana\nbananabananabananab\nanana',
              //   'images/avatar.png',
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Department',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                // Text(
                //   'See All',
                //   style: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.grey,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Column(
            children: <Widget>[
              department(
                  'Bachlore of Computer \n Application',
                  'images/scholarship.png',
                  'Bachlore of Computer \n Application'),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Teaching Staff',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                // Text(
                //   'See All',
                //   style: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.grey,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          SizedBox(height: 13.0),

          // ListView(
          //   scrollDirection: Axis.horizontal,
          // children: <Widget>[
          //   Material(
          //     elevation: 4.0,
          //     borderRadius: BorderRadius.circular(20),
          //     child: Card(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),

          //       ),
          //       child: Container(
          //         height: 200,
          //         width: 200,
          //         child: FutureBuilder(
          //             future: LoadImages(),
          //             builder: (context, AsyncSnapshot snapshot) {
          //               if (snapshot.connectionState ==
          //                   ConnectionState.waiting) {
          //                 return Center(
          //                   child: CircularProgressIndicator(),
          //                 );
          //               }
          //               return ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 itemCount: snapshot.data.length ?? 0,
          //                 itemBuilder: (context, index) {
          //                   final Map image = snapshot.data[index];
          //                   return Padding(
          //                     padding: const EdgeInsets.only(
          //                         top: 0, left: 0, right: 0),
          //                     child: Row(
          //                       children: <Widget>[
          //                         Expanded(
          //                           child: Card(
          //                             elevation: 0.4,
          //                             shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15)),

          //                             child: Container(
          //                               height: 100.0,
          //                               width: 125.0,
          //                               decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(7.0),
          //                               ),
          //                               child: Image.network(
          //                                 image['url'],
          //                                 fit: BoxFit.cover,
          //                               ),
          //                             ),

          //                             // child: Container(
          //                             //   decoration: BoxDecoration(
          //                             //     borderRadius:
          //                             //         BorderRadius.circular(15),
          //                             //   ),
          //                             //   height: 200,
          //                             //   child: Image.network(
          //                             //     image['url'],
          //                             //     fit: BoxFit.cover,
          //                             //   ),
          //                             // ),
          //                           ),
          //                         ),
          //                         // IconButton(
          //                         //   icon: Icon(
          //                         //     Icons.delete,
          //                         //     color: Colors.black,
          //                         //   ),
          //                         //   onPressed: () async {
          //                         //     await delete(image['path']);

          //                         //     ScaffoldMessenger.of(context).showSnackBar(
          //                         //       SnackBar(
          //                         //         backgroundColor: Colors.green,
          //                         //         shape: RoundedRectangleBorder(
          //                         //             borderRadius: BorderRadius.circular(10)),
          //                         //         content: Text("Image Deleted Successfully"),
          //                         //       ),
          //                         //     );
          //                         //   },
          //                         // ),
          //                       ],
          //                     ),
          //                   );
          //                 },
          //               );
          //             },
          //           ),
          //       ),
          //     ),
          //   ),
          // ],
          // ),

          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              height: 200.0,
              width: 300.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  //   Image.network(image['url'], fit: BoxFit.cover,),
                  //  // getWorks(Image.network(image['url'], fit: BoxFit.cover,),),
                  //   getWorks('images/ttwo.jpg'),
                  //   getWorks('images/tfive.jpg'),
                  //   getWorks('images/tthree.webp'),
                  //   getWorks('images/tfour.jpg'),

                  getWorks(),
                  //TeachingStaff(),

                  // Padding(
                  //   padding: EdgeInsets.all(0.0),
                  //   child:
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Contact',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                // Text(
                //   'See All',
                //   style: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.grey,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          // Column(
          //   children: <Widget>[
          //     contact('miraj', 'images/tfour.jpg', 'second'),
          //   ],
          // ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('images/buildings.png'),
                  ),
                  title: Text(
                    'Miraj',
                  ),
                ),
                ListTile(
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('images/capitol.png'),
                  ),
                  title: Text(
                    'Maharashtra, 410410',
                  ),
                ),
                // ListTile(
                //   leading: Icon(Icons.code),
                //   title: Text(
                //     '',
                //   ),
                // ),
                ListTile(
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('images/email.png'),
                  ),
                  title: Text(
                    'mirajmahavidyalaya@gmail.com',
                  ),
                ),
                ListTile(
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('images/call.png'),
                  ),
                  title: Text(
                    '09090909099',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home.png',
              height: 30,
              width: 30,
            ),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/noticeboard.png',
              height: 30,
              width: 30,
            ),
            label: 'Notice',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/gallery.png',
              height: 30,
              width: 30,
            ),
            label: 'Images',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/team.png',
              height: 30,
              width: 30,
            ),
            label: 'About Us',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget getWorks() {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Container(
          height: 500.0,
          width: 380.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
           
          ),
          child: FutureBuilder(
            future: LoadImages(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length ?? 0,
                itemBuilder: (context, index) {
                  final Map image = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Material(
                            elevation: 4.0,
                            // color: Colors.grey,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            child: Card(
                              elevation: 4.0,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(20),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  image['url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              
                            ),
                            
                          ),
                          
                        ),
                        SizedBox(width: 10,),
                        // Expanded(
                        //   child: Card(
                        //     elevation: 0.4,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.circular(15)),

                        //     child: Container(
                        //       height: 400.0,
                        //       width: 225.0,
                        //       decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.circular(7.0),
                        //       ),
                        //       child: ListView(scrollDirection: Axis.horizontal,
                        //       children: [
                        //         Image.network(
                        //         image['url'],
                        //         fit: BoxFit.cover,
                        //       ),
                        //       ],)
                        //     ),

                        //     // child: Container(
                        //     //   decoration: BoxDecoration(
                        //     //     borderRadius:
                        //     //         BorderRadius.circular(15),
                        //     //   ),
                        //     //   height: 200,
                        //     //   child: Image.network(
                        //     //     image['url'],
                        //     //     fit: BoxFit.cover,
                        //     //   ),
                        //     // ),
                        //   ),
                        // ),
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.black,
                        //   ),
                        //   onPressed: () async {
                        //     await delete(image['path']);

                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         backgroundColor: Colors.green,
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(10)),
                        //         content: Text("Image Deleted Successfully"),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget menuCard(
    String title,
    String imgPath,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 150.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 130.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              SizedBox(
                width: 13.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget department(
    String title,
    String imgPath,
    String second,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 150.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage(imgPath), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Image(
                    image: AssetImage(imgPath),
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 57.0,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  // Text(
                  //   second,
                  //   style:
                  //       TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(
                  //   height: 7.0,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget contact(
    String title,
    String imgPath,
    String second,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 250.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  // Container(
                  //   height: 100.0,
                  //   width: 100.0,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage(imgPath), fit: BoxFit.cover),
                  //     borderRadius: BorderRadius.circular(7.0),
                  //   ),
                  // ),
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    second,
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getStar(rating, index) {
    if (rating >= index) {
      return Icon(
        Icons.star,
        color: Colors.yellow,
      );
    } else {
      return Icon(
        Icons.star,
        color: Colors.grey.withOpacity(0.5),
      );
    }
  }
}
