import 'dart:collection';

import '../services/api.dart';

import '../models/perfume.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/routes.dart';
import '../pages/perfume_details/details_page.dart';

//import 'package:cached_network_image/cached_network_image.dart';
class PerfumeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PerfumeListState();
  }
}

class _PerfumeListState extends State<PerfumeList> {
  List<Perfume> _perfumessss = [];

  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("perfume list"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
          onPressed: (){
            showSearch(
              context: context,
              delegate:  PerfumeSearch(buildPerfumeitem: _buildPerfumeitemForSearch, loadPerfumes: _loadPerfumes,perfumes: _perfumessss)

            );

            PerfumeSearch(buildPerfumeitem: _buildPerfumeitem, loadPerfumes: _loadPerfumes,perfumes: _perfumessss);
            
          },
          )

        ],
      ),
      backgroundColor: Colors.grey,
      body: _buildBody(),
    );
  }

  _getAppTitleWidget() {
    return Text(
      'Perfumes',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.0),
    );
  }

  _buildBody() {
    return 
       FutureBuilder(
            future: _loadPerfumes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Perfume>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) =>
                        _buildPerfumeitem(ctx, index, snapshot.data),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                  );
                }
              }
              return Center(child: CircularProgressIndicator());
            },
          );
  }

  Widget _buildPerfumeitem(
      BuildContext context, int index, List<Perfume> perfume) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        header: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
        ),
        child: GestureDetector(
          onTap: () {
            _navigateToPerfumeDetails(perfume[index], index);
          },
          child: Image.network(
            perfume[index].mainPicture,
            fit: BoxFit.fill,
          ),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black54, title: Text(perfume[index].name)),
      ),
    );
  }



  Widget _buildPerfumeitemForSearch(
      BuildContext context, int index, List<Perfume> perfume) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        
        child: GestureDetector(
          onTap: () {
            _navigateToPerfumeDetails(perfume[index], index);
          },
          child: Image.network(
            perfume[index].mainPicture,
            fit: BoxFit.fill,
          ),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black54, title: Text(perfume[index].name)),
      ),
    );
  }

/*
  _getListViewWidget() {
    return new Flexible(
      child: new RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _perfumes.length,
          itemBuilder: _buildPerfumeitem,
        ),
      ),
    );
  }
*/
  void filterSearchResults(String query) {
    List<Perfume> dummySearchList = List<Perfume>();
    dummySearchList.addAll(_perfumessss);
    if (query.isNotEmpty) {
      List<Perfume> dummyListData = List<Perfume>();
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _perfumessss.clear();
        _perfumessss.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _perfumessss.clear();
        _perfumessss.addAll(_perfumessss);
      });
    }
  }

  Future<Null> refresh() {
    _loadPerfumes();
    return new Future<Null>.value();
  }

  Future<List<Perfume>> _loadPerfumes() async {
    String filedata =
        await DefaultAssetBundle.of(context).loadString("assets/perfumes.json");
    return PerfumeApi.allperfumesjson(filedata);
  }

  _navigateToPerfumeDetails(Perfume perfume, Object avatarTag) {
    Navigator.of(context).push(new FadePageRoute(
        builder: (x) {
          return new PerfumeDetailsPage(perfume, avatarTag: avatarTag);
        },
        settings: new RouteSettings()));
  }
}

class PerfumeSearch extends SearchDelegate<Perfume> {
  final List<Perfume> perfumes;
  final Function loadPerfumes;
  final Function buildPerfumeitem;

  PerfumeSearch({this.perfumes, this.loadPerfumes, this.buildPerfumeitem});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
     return FutureBuilder(
        future: loadPerfumes(),
        builder: (BuildContext context, AsyncSnapshot<List<Perfume>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final results = snapshot.data
              .where((perfume) => perfume.name.toLowerCase().contains(query.toLowerCase())).toList();

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: results.length,
            itemBuilder: (ctx, index) => buildPerfumeitem(ctx, index, results),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          );
        });;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: loadPerfumes(),
        builder: (BuildContext context, AsyncSnapshot<List<Perfume>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final results = snapshot.data
              .where((perfume) => perfume.name.toLowerCase().contains(query.toLowerCase())).toList();

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: results.length,
            itemBuilder: (ctx, index) => buildPerfumeitem(ctx, index, results),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          );
        });
  }
}
