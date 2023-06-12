import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RetrivingImageFromDb extends StatefulWidget {
  const RetrivingImageFromDb({Key? key}) : super(key: key);

  @override
  _RetrivingImageFromDbState createState() => _RetrivingImageFromDbState();
}

class _RetrivingImageFromDbState extends State<RetrivingImageFromDb> {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<List> LoadImages() async {
    List<Map> files = [];
    final ListResult result =
        await FirebaseStorage.instance.ref().child('files').listAll();
    final List<Reference> allFiles = result.items;
    await Future.forEach(allFiles, (Reference file) async {
      final String fileUrl = await file.getDownloadURL();
      files.add({"url": fileUrl, "path": file.fullPath});
    });
    print(files);
    return files;
  }

  // Future<void> delete(String ref) async {
  //   await firebaseStorage.ref(ref).delete();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xEADFDDDD),
        appBar: AppBar(title: Text('Images'),
         backgroundColor: Color.fromARGB(255, 117, 2, 98),),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Container(
            child: FutureBuilder(
              future: LoadImages(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data.length ?? 0,
                  itemBuilder: (context, index) {
                    final Map image = snapshot.data[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 25, right: 15),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Card(
                              elevation: 0.4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 200,
                                child: Image.network(
                                  image['url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
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
        ));
  }
}
