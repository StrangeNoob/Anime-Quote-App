import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';
import 'package:anime_qoutes/FullScreenImagePath.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpapersList,editorList;
 final CollectionReference collectionReference = Firestore.instance.collection("images");


  @override
  void initState() {
      super.initState();
      subscription = collectionReference.snapshots().listen((datasnapshots){
        setState(() {
         wallpapersList= datasnapshots.documents; 
        });
      });
  } 
  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
           @override
           Widget build(BuildContext context) {
             return new Container(
               child: wallpapersList != null
                     ? new GridView.count(
          crossAxisCount:  2,
          children: List.generate(wallpapersList.length,(index){
            String   imgPath =wallpapersList[index].data['url'];
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
                     : new Center(
                   child: new CircularProgressIndicator(),
                 )
              );
           }
         }
