import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class SlideShowWidget extends StatefulWidget {
  @override
  _SlideShowWidgetState createState() => _SlideShowWidgetState();
}

class _SlideShowWidgetState extends State<SlideShowWidget> {
  final PageController ctrl = PageController(viewportFraction: 0.8);
  final Firestore db = Firestore.instance;
  Stream slides;

  String activeTag = 'favorites';
  int currentpage = 0;

  @override
  void initState() {
    _queryDb();

    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentpage != next) {
        setState(() {
          currentpage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: slides,
      initialData: [],
      builder: (context, AsyncSnapshot snap) {
        List slidlist = snap.data.toList();

        return PageView.builder(
          controller: ctrl,
          itemCount: slidlist.length + 1,
          itemBuilder: (context, int currentIndx) {
            if (currentIndx == 0) {
              return _buildTagPage();
            } else if (slidlist.length >= currentIndx) {
              bool active = currentIndx == currentpage;
              return _buildPerfumePage(slidlist[currentIndx - 1], active);
            }
          },
        );
      },
    );
  }

  Stream _queryDb({String tag = 'favorites'}) {
    Query query = db.collection('Perfumes').where('tag', arrayContains: tag);

    slides =
        query.snapshots().map((list) => list.documents.map((doc) => doc.data));

    setState(() {
      activeTag = tag;
    });
  }

  Widget _buildPerfumePage(Map data, bool active) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(data['image']),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius: blur,
                offset: Offset(offset, offset))
          ]),
      child: Center(
        child: Text(data['Name']),
      ),
    );
  }

  _buildbtn(tag) {
    Color color = tag == activeTag ? Colors.purple : Colors.white;
    return FlatButton(
      color: color,
      child: Text('#$tag'),
      onPressed: () => _queryDb(tag: tag),
    );
  }

  Widget _buildTagPage() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Your perfumes'),
          _buildbtn('favorites'),
          _buildbtn('hate'),
          _buildbtn('Wedding'),
          _buildbtn('mood'),
        ],
      ),
    );
  }
}
