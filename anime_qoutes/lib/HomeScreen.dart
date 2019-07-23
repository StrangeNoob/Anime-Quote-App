import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:async';
import './FullScreenImagePath.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<QuerySnapshot> subscription;
  QuerySnapshot querySnapshot;
  List<DocumentSnapshot> wallpapersList;
 final CollectionReference collectionReference = Firestore.instance.collection("images");


  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnapshot){
      setState(() async {
        print(datasnapshot);
        print("Hello");
        var firestore = Firestore.instance;
        QuerySnapshot qn = await firestore.collection("images").getDocuments();
        wallpapersList = qn.documents;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body:
            wallpapersList != null
            ? new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: wallpapersList.length,
          itemBuilder: (context, i) {
            String imgPath = wallpapersList[i].data['url'];
            print(imgPath);
            return new Material(
              elevation: 8.0,
              borderRadius:
              new BorderRadius.all(new Radius.circular(8.0)),
              child: new InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                          new FullScreenImagePage(imgPath)));
                },
                child: new Hero(
                  tag: imgPath,
                  child: new FadeInImage(
                    image: new NetworkImage(imgPath),
                    fit: BoxFit.cover,
                    placeholder: new AssetImage("assets/wallfy.png"),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (i) =>
          new StaggeredTile.count(2, i.isEven ? 2 : 3),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        )
            : new Center(
          child: new CircularProgressIndicator(),
        ));
  }
}

