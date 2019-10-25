import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final TextStyle topMenuStyle = new TextStyle(
      fontFamily: 'Avenir next',
      fontSize: 20,
      color:Colors.white,
      fontWeight: FontWeight.w600);
  final TextStyle buttonInfoStyle = new TextStyle(
      fontFamily: 'Avenir next',
      fontSize: 10,
      color:Colors.white,
      fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return new Material(
      
      child: Container(
          // color: Colors.red,
          child: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 430,
              // color: Colors.blue,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("images/starwars1.jpg"),
                    fit: BoxFit.fitWidth),
              ), // we can change to be backgroundimage instead
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppBar(
                    title: Text("3baq-Perfumes"),
                    centerTitle: true,
                    leading: Icon(Icons.spa),
                    actions: <Widget>[
                      PopupMenuButton<String>(
                        onSelected: (String choice) {},
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                               PopupMenuItem<String>(
                                child: FlatButton(
                                  child: Text(
                                    'Perfumes',
                                      style: TextStyle(
                                        fontFamily: 'Avenir next',
                                        color:Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ), onPressed: () {},
                                ),
                              ),
                               PopupMenuItem<String>(
                                child: FlatButton(
                                  child: Text(
                                    'Brands ',
                                    style: TextStyle(
                                        fontFamily: 'Avenir next',
                                        color:Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ), onPressed: () {},
                                ),
                              ),
                               PopupMenuItem<String>(
                                child: FlatButton(
                                  child: Text(
                                    'My List',
                                      style: TextStyle(
                                        fontFamily: 'Avenir next',
                                        color:Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ), onPressed: () {},
                                ),
                              ),
                            ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.add, color:Colors.grey, size: 30),
                        Text(
                          'My List',
                          style: buttonInfoStyle,
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    color:Colors.white,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.share,
                          color:Colors.grey,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.info,
                          color:Colors.grey,
                          size: 30,
                        ),
                        Text(
                          'Info',
                          style: buttonInfoStyle,
                        )
                      ],
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            makePopularWidget("Popular on Perfumer"),
            makePopularWidget("Trending Now"),
            //makeContinueWatching("Consinue Watching for Kalle"),
            bannerMovie(),
            makeNetflixOrig('Perfumer ORIGINALS >'),
            makePopularWidget("Buy It Again"),
            makePopularWidget("New Perfumes"),
       
          ],
        ),
      )),
    );
  }

  Widget bannerMovie() {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Best Wedding Perfumes',
              style: topMenuStyle,
            ),
          ),
          Container(
            child: Image(
              image: new AssetImage("images/birdboxBanner.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            color:Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.photo_library,
                          color:Colors.grey,
                        ),
                        Text(
                          'View',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  color:Colors.white,
                  onPressed: () {},
                ),
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color:Colors.grey,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  color: Color(0xff4f4f4f),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makeNetflixOrig(String title) {
    return new Container(
      padding: EdgeInsets.only(top: 30, left: 10),
      height: 400,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]),
          ),
          Container(
            height: 350,
            child: ListView(
                padding: EdgeInsets.only(right: 6),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeOriginals()),
          )
        ],
      ),
    );
  }

  int counter = 0;
  List<Widget> makeOriginals() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        width: 200,
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image:
                  new AssetImage("images/" + counter.toString() + ".jpg"),
              fit: BoxFit.fitHeight),
        ),
      ));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }

  Widget makePopularWidget(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]),
          ),
          Container(
            height: 200,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContainers()),
          )
        ],
      ),
    );
  }

  Widget makeContinueWatching(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]),
          ),
          Container(
            height: 200,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContinueContainers()),
          )
        ],
      ),
    );
  }

  List<Widget> makeContainers() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
        padding: EdgeInsets.all(5),
        height: 200,
        child: Image(
          image: AssetImage("images/" + counter.toString() + ".jpg"),
        ),
      ));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }

  List<Widget> makeContinueContainers() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
          padding: EdgeInsets.all(2),
          height: 200,
          child: Column(
            children: <Widget>[
              Container(
                height: 140,
                width: 100,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage(
                          "images/" + counter.toString() + ".jpg"),
                      fit: BoxFit.fitHeight),
                ),
                child: Center(
                    child: FlatButton(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 70,
                  ),
                  onPressed: () {},
                )),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.only(left: 10, right: 10),
                color:Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 25),
                      child: Text(
                        'S1:E' + i.toString(),
                        style: TextStyle(color: Color(0xffc1c1c1)),
                      ),
                    ),
                    Icon(Icons.info, size: 15, color: Color(0xffc1c1c1))
                  ],
                ),
              )
            ],
          )));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }
}
