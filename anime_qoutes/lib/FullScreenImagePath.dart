import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FullScreenImagePage extends StatefulWidget {
  final String imgPath;
  FullScreenImagePage(this.imgPath);

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [new Color(0x10000000), new Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
       final FlareControls flareControls = FlareControls();
       bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
                      elevation: 0.0,
                      backgroundColor: Color(0x10000000),
                      leading: new IconButton(
                        icon: new Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                  ),
      body: GestureDetector(
        onDoubleTap: (){
           setState(() {
              isLiked = !isLiked;
              print(isLiked);
            });
            flareControls.play("like");
        },
     child: new SizedBox.expand(
        child: new Container(
          decoration: new BoxDecoration(gradient: backgroundGradient),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child: new Hero(
                  tag: widget.imgPath,
                  child: new Image.network(widget.imgPath,
                  ),
                ),
              ),
               new Align(
              alignment: Alignment.center,
               child: new Container(
                width: double.infinity,
                height: 250,
                child: Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: FlareActor(
                      'assets/images/instagram_like.flr',
                      controller: flareControls,
                      animation: 'idle',
                    ),
                    ),
                    ),
               ),
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}