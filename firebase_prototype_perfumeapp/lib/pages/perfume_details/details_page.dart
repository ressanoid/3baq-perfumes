import '../../models/perfume.dart';
import 'package:flutter/material.dart';
//import 'package:meta/meta.dart';
import './header/details_header.dart';
import './details_body.dart';
import './footer/perfume_pages.dart';
class PerfumeDetailsPage extends StatefulWidget {
  final Perfume perfume;
  final Object avatarTag;

  PerfumeDetailsPage(this.perfume, {this.avatarTag});
  @override
  State<StatefulWidget> createState() {
    return new _PerfuemDetailsPageState();
  }
}

class _PerfuemDetailsPageState extends State<PerfumeDetailsPage> {
  int _currentIndex = 0;

  _getPerfumeProperty(BuildContext context, int index) {
    List<Widget> _children = [
      //new PerfuemGallery(widget.perfume),
      new PerfumeDetailsBody(widget.perfume),
      new PerfumeOpinions(widget.perfume),
    //  new PerfumeComments(widget.perfume),
      new PerfumeLongevity(widget.perfume),
      new PerfumeSillage(widget.perfume),
      new PerfumeWhereToBuy(widget.perfume),
    ];
    return _children[index];
  }

  var lineargradiant = new BoxDecoration(
      gradient: new LinearGradient(
          begin: FractionalOffset.centerRight,
          end: FractionalOffset.bottomLeft,
          colors: [Colors.red, Colors.redAccent]));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.perfume.name,)
      ),
      body: 
      
      SingleChildScrollView(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new PerfumeDetailsHeader(
                widget.perfume,
                avatarTag: widget.avatarTag,
              ),
              _getPerfumeProperty(context, _currentIndex),
            ],
          ),
        ),
      ),
 bottomNavigationBar: BottomNavigationBar(
        onTap: _ontapNavigation,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
      /*    new BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black45,
            ),
            title: Text(
              'Gallery',
              style: TextStyle(color: Colors.black45),
            ),
          ),*/
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outline,
              color: Colors.black45,
            ),
            title: Text(
              'Details',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.sentiment_satisfied,
              color: Colors.black45,
            ),
            title: Text(
              'opinions',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          /*new BottomNavigationBarItem(
            icon: Icon(
              Icons.comment,
              color: Colors.black45,
            ),
            title: Text(
              'Comments',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          */
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.timer,
              color: Colors.black45,
            ),
            title: Text(
              'Longevity',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.wifi_tethering,
                color: Colors.black45,
              ),
              title: Text(
                'Sillage',
                style: TextStyle(color: Colors.black45),
              )),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black45,
            ),
            title: Text(
              'Buy',
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }

  void _ontapNavigation(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
