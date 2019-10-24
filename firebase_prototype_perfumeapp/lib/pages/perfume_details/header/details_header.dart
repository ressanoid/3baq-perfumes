import '../../../models/perfume.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import './perfume_background_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PerfumeDetailsHeader extends StatefulWidget {
  final Perfume perfume;
  final Object avatarTag;

  PerfumeDetailsHeader(this.perfume, {@required this.avatarTag});

  @override
  State<StatefulWidget> createState() {
    return new _PerfumeDetailsHeaderState();
  }
}

class _PerfumeDetailsHeaderState extends State<PerfumeDetailsHeader> {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenwidth = MediaQuery.of(context).size.width;
    var diagonalcut = new DiagonallyCutColoredImage(new Image.asset(
      BACKGROUND_IMAGE,
      width: screenwidth,
      height: 280.0,
      fit: BoxFit.cover,
    ),
    color: const Color(0xA9A9A9F5),
    
    );
    var avatar = new Hero(
      tag: widget.avatarTag,
      child:
      Container(
        width: 250.0,
        height: 200.0,
              child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        
        child: GridTile(

            child: CachedNetworkImage(imageUrl: widget.perfume.mainPicture,)
            ),
          ),
      ),
      );
    var perfumeProperties = new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        children: <Widget>[
          new Icon(
            Icons.favorite,
            size: 16.0,
            color: Colors.white,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              widget.perfume.isOwned.length.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white),
            ),
          ),
          new Icon(
            Icons.thumb_up,
            size: 16.0,
            color: Colors.white
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              widget.perfume.isliked.length.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white),
            ),
          ),
          new Icon(
            Icons.bookmark,
            size: 16.0,
            color: Colors.white
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              widget.perfume.isMain.length.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white),
            ),
          ),
         
          
         
        
        
       
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );

    var actionButtons = new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: Colors.lightGreen,
              textColor: Colors.white,
              onPressed: () async {
                //TODO Handle Adopt
              },
              child: new Text('Favorite'),
            ),
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new RaisedButton(
              color: Colors.lightGreen,
              disabledColor: Colors.grey,
              textColor: Colors.white,
              onPressed: () async {
                //TODO Handle Like
              },
              child: new Text('LIKE'),
            ),
          ),
        ],
      ),
    );

    return new Stack(
      children: [
diagonalcut,
        new Align(

          child: new Column(
          
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              avatar,
              //perfumeProperties,
              //actionButtons,
            ],
          ),
        ),
      ],
    );
  }
}
