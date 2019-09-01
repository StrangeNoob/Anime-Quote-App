import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:anime_qoutes/FullScreenImagePath.dart';

class ViewEditors extends StatefulWidget {
  final String editorName;
  ViewEditors(this.editorName);
  @override
  _ViewEditorsState createState() => _ViewEditorsState();
}

class _ViewEditorsState extends State<ViewEditors> {
  
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> allImages;
  final CollectionReference collectionReference = Firestore.instance.collection("images");
  
  @override
  void initState() {
  
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshots){
        setState(() {
              allImages=datasnapshots.documents;
              });
              allImages.retainWhere((doc)=> doc.data['editor']==widget.editorName);
        });
  }
    @override
  void dispose() {
  
    subscription?.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(widget.editorName),
          elevation: 2.0,
          titleSpacing: 0.50,
          backgroundColor: Colors.black.withAlpha(4),
        ),
        body: Container(
        color: Colors.white,
        child: GridView.count(
          crossAxisCount:  2,
          children: List.generate(allImages.length,(index){
            String   imgPath =allImages[index].data['url'];
            return new Padding(
              padding: EdgeInsets.all(3.0),
              child: new Material(
                         elevation: 8.0,
                         borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                         child: new InkWell(
                           onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => FullScreenImagePage(imgPath)));
                           },
                           child: new Hero(
                             tag: imgPath,
                             child: new FadeInImage(
                               image: new NetworkImage(imgPath),
                               fit: BoxFit.cover,
                               placeholder: new AssetImage("assets/images/wallfy.png"),
                             ),
                           ),
                         ),
                       ),
                       );
          })
          )
        
      ),
    );
  }
}