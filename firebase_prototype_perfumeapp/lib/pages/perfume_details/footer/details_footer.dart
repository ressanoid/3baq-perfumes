import '../../../models/perfume.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import './perfume_pages.dart';
class PerfumeDetailsFooter extends StatefulWidget {
  final Perfume perfume;

  PerfumeDetailsFooter(this.perfume);

  @override
  State<StatefulWidget> createState() {
    return new _PerfumeDetailsFooterState();
  }
}

class _PerfumeDetailsFooterState extends State<PerfumeDetailsFooter>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    _tabs = [
    /*  new Tab(
        text: "Pictures",
      ),*/
      new Tab(
        text: "Details",
      ),
      new Tab(
        text: "Vote",
      ),
/*      new Tab(
        text: "Comments",
      ),*/

      new Tab(
        text: "Longevity",
      ),
      new Tab(
        text: "Sillage",
      )
    ];

    _pages = [
      //new PerfuemGallery(widget.perfume),
      new PerfumeDetails(widget.perfume),
      new PerfumeOpinions(widget.perfume),
      //new PerfumeComments(widget.perfume),
      new PerfumeLongevity(widget.perfume),
      new PerfumeSillage(widget.perfume),
       
    ];

    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[

          new TabBar(
controller: _controller,
tabs: _tabs,
indicatorColor: Colors.white,

          ),
          new SizedBox.fromSize(size: const Size.fromHeight(300.0), child: TabBarView(controller: _controller , children: _pages,),)
        ],
      ),
    );
  }
}
