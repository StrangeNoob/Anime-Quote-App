import 'dart:async';

import 'package:anime_qoutes/ViewEditors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Editors extends StatefulWidget {
  @override
  _EditorsState createState() => _EditorsState();
}

class _EditorsState extends State<Editors> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> editorList;
  final CollectionReference collectionReference =
      Firestore.instance.collection("Editors");
  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshots) {
      setState(() {
        editorList = datasnapshots.documents;
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
        child: GridView.count(
            padding: EdgeInsets.all(5.0),
            crossAxisCount: 2,
            children: List.generate(editorList.length, (index) {
              String imgPath = editorList[index].data['thumbnail'];
              String editorName = editorList[index].documentID;
              return Padding(
                padding: const EdgeInsets.only(left: 4.0,bottom: 0.0,top: 4.0),
                child: new Material(
                  elevation: 8.0,
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      new InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewEditors(editorName)));
                        },
                        child: new Hero(
                          tag: imgPath,
                          child: new FadeInImage(
                            image: new NetworkImage(imgPath),
                            fit: BoxFit.fill,
                            placeholder:
                                new AssetImage("assets/images/wallfy.png"),
                          ),
                        ),
                      ),
                      new Text(
                        editorName,
                        textAlign: TextAlign.center,
                        
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            color: Colors.cyan,
                            backgroundColor: Colors.black.withAlpha(4)),
                      ),
                    ],
                  ),
                ),
              );
            }
            ),
            ),
        );
  }
}
