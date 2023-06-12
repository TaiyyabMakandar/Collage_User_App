import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class UploadedNotice extends StatefulWidget {
  const UploadedNotice({Key? key}) : super(key: key);

  @override
  _UploadedNoticeState createState() => _UploadedNoticeState();
}

class _UploadedNoticeState extends State<UploadedNotice> {
  late Query _ref;
  final databaseReference =
      FirebaseDatabase.instance.reference().child('Uploaded Notice');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Uploaded Notice')
        .orderByChild('notice1');
  }
  // Widget _buildNoticeItem({Map contact}){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Important Notice'),
         backgroundColor: Color.fromARGB(255, 117, 2, 98),
      ),
      body: Column(
        children: [
          Flexible(
            child: FirebaseAnimatedList(
                query: _ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.label_important,
                          color: Colors.black,
                        ),
          
                        title: Text(snapshot.value['notice1']),
                        // subtitle: Text(snapshot.value['notice2']),
                      ),
                     
                      Container(
                        width: double.infinity,
                        height: 0.75,
                        color: Colors.grey,
                      ),
                    ],
                  );
                }),
          ),
          //  IconButton(
          //               icon: Icon(Icons.delete),
          //               onPressed: () {
          //                 // databaseReference.child('notice1').remove();
          //                 //databaseReference.child(Key).remove();
          //                 FirebaseDatabase.instance
          //                     .reference()
          //                     .child('Uploaded Notice')
          //                    // .child('notice1')
          //                     .remove();
          //               },
          //             ),
        ],
      ),
    );
    // }
    // DeleteData(BuildContext context, String key){
    //  setState(() {
    //     databaseReference.child(key).remove();
    //  });
    // }
  }
}
  // void _deleteRecord(var key) async{
  //   await DatabaseReference.child('notice').remove();
  // }
