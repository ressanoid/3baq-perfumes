import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/perfume_list.dart';

import './pages/homepage.dart';
import './pages/profile.dart';
import './providers/perfumes.dart';
import './pages/note_list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Perfumes()
      ,
          child: MaterialApp(
        title: 'Perfume App Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor:  Colors.blueAccent,
          fontFamily: 'Ubuntu'
        ),
        home: DefaultTabController(
          length: 4,
          child: Theme(
            data: ThemeData(brightness: Brightness.light),
            child: Scaffold(
              bottomNavigationBar: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.home,
                      ),
                      text: "Home",
                    ),
                    Tab(icon: Icon(Icons.search), text: "Search"),
                    Tab(icon: Icon(Icons.list), text: "More"),
                    Tab(icon: Icon(Icons.person), text: "Profile"),
                  ],
                  unselectedLabelColor: Color(0xff999999),
                  labelColor: Colors.blue,
                  indicatorColor: Colors.transparent),
              body: TabBarView(
                children: [
                  HomePage(),
                  PerfumeList(),
                 NoteList(),
                  UserProfilePage(),
                ],
              ),
            ),
          ))
        
        
        //Scaffold(body: SlideShowWidget(),)
        
            ),
    );
  }
}