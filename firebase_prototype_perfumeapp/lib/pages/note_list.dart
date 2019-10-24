import 'package:cached_network_image/cached_network_image.dart';

import '../services/api.dart';

import '../models/notes.dart';
import 'package:flutter/material.dart';
import 'dart:async';

//import 'package:cached_network_image/cached_network_image.dart';
class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  List<Note> _notes = [];
  List<Note> selectedNotes = [];
  List<String> selectedNotesName = [];
  List<String> searchNotesName = [];
  List<Note> duplicateNotes = [];
  List<Note> dummyListData = List<Note>();

  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    duplicateNotes.addAll(_notes);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Note> dummySearchList = List<Note>();
    dummySearchList.addAll(_notes);
    if (query.isNotEmpty) {
      dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _notes = dummyListData;

        print(dummyListData);
      });
      return;
    } else {
      setState(() {
        _notes.clear();
        _notes.addAll(duplicateNotes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return /*new Scaffold(
      appBar: AppBar(
        title: Text("Note list"),
       ),
      backgroundColor: Colors.grey,
      body: */
        _buildBody();
  }

  _buildBody() {
    return FutureBuilder(
      future: _loadNotes(),
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: editingController,
                      decoration: InputDecoration(
                          labelText: "Search Notes",
                          hintText: "Search Notes",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: dummyListData.isEmpty
                          ? _notes.length
                          : dummyListData.length,
                      itemBuilder: (ctx, index) => _buildNoteitem(ctx, index,
                          dummyListData.isEmpty ? _notes : dummyListData),
                    ),
                  ),
   Container(
	margin: EdgeInsets.all(12),
	height: 50.0,
	width: double.infinity,
	child: Material(
	  color: Colors.grey,
	  child: InkWell(
		child: Center(
			child: Text("Search for Perfume",
				style: Theme.of(context).textTheme.body1)),
		onTap: () {},
	  ),
	),
  )
                ],
              ),
            );
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildNoteitem(BuildContext context, int index, List<Note> note) {
    return CheckboxListTile(
      onChanged: (bool value) {
        setState(() {
          if (value) {
            setState(() {
              selectedNotesName.add(note[index].name);
            });
          } else {
            setState(() {
              selectedNotesName.remove(note[index].name);
            });
          }
        });

        print(selectedNotesName);
      },
      value: selectedNotesName.contains(note[index].name),
      title: new Text(note[index].name),
      secondary: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(note[index].image),
      ),
    );
  }

  Widget _buildNoteitemForSearch(
      BuildContext context, int index, List<Note> note) {
    return CheckboxListTile(
      onChanged: (bool value) {
        setState(() {
          if (value) {
            setState(() {
              selectedNotesName.add(note[index].name);
            });
          } else {
            setState(() {
              selectedNotesName.remove(note[index].name);
            });
          }
        });

        print(selectedNotesName);
      },
      value: selectedNotesName.contains(note[index].name),
      title: new Text(note[index].name),
      secondary: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(note[index].image),
      ),
    );
  }

  Future<Null> refresh() {
    _loadNotes();
    return new Future<Null>.value();
  }

  Future<List<Note>> _loadNotes() async {
    String filedata =
        await DefaultAssetBundle.of(context).loadString("assets/notes.json");
    _notes = NoteApi.allnotesjson(filedata);
    return _notes;
  }
}

class NoteSearch extends SearchDelegate<Note> {
  final List<Note> notes;
  final Function loadNotes;
  final Function buildNoteitem;

  NoteSearch({this.notes, this.loadNotes, this.buildNoteitem});

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
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: loadNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final results = snapshot.data
              .where((perfume) =>
                  perfume.name.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: results.length,
            itemBuilder: (ctx, index) => buildNoteitem(ctx, index, results),
          );
        });
    ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: loadNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final results = snapshot.data
              .where((perfume) =>
                  perfume.name.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: results.length,
            itemBuilder: (ctx, index) => buildNoteitem(ctx, index, results),
          );
        });
  }
}
