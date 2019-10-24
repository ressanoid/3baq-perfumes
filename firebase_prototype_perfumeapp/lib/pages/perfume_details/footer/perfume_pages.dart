import '../../../models/perfume.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class PerfuemGallery extends StatelessWidget {
  Perfume perfume;

  PerfuemGallery(this.perfume);

  @override
  Widget build(BuildContext context) {
    var pictures = <Widget>[];

      var url = perfume.image;
      var image = new CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => new CircularProgressIndicator(),
        width: 200.0,
        height: 200.0,
      );

      var url2 = perfume.mainPicture;
      var image2 = new CachedNetworkImage(
        imageUrl: url2,
        placeholder: (context, url) => new CircularProgressIndicator(),
        width: 200.0,
        height: 200.0,
      );
      pictures.add(image2);
    
    var delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );
    return new GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: pictures);
  }
}

class PerfumeDetails extends StatelessWidget {
  Perfume perfume;
  PerfumeDetails(this.perfume);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(child: Text("details"));
  }
}

class Perfumebarchart {
  String property;
  charts.Color color;
  int count;

  Perfumebarchart(this.property, Color color, this.count)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

/*
class PerfumeProperties extends StatefulWidget {
  

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PerfumePropertiesState();
  }
}
*/
class PerfumeOpinions extends StatelessWidget {
  Perfume perfume;
  PerfumeOpinions(this.perfume);
  @override
  Widget build(BuildContext context) {
    var data = [
      new Perfumebarchart("Liked", Colors.indigo, perfume.isliked.length),
      new Perfumebarchart("Main Perfume", Colors.blue, perfume.isMain.length),
      new Perfumebarchart("Owned", Colors.green, perfume.isOwned.length),
    ];

  
    var series =[
      new charts.Series<Perfumebarchart, String>(
          id: 'Sales',
          domainFn: (Perfumebarchart perfume, _) => perfume.property,
          measureFn: (Perfumebarchart perfume, _) => perfume.count,
          colorFn: (Perfumebarchart perfume, _) => perfume.color,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (Perfumebarchart perfume, _) =>
              '${perfume.property}: ${perfume.count}')
    ];
    // TODO: implement build
    return Container(
   padding: EdgeInsets.all(20),
   height: MediaQuery.of(context).size.height*0.35,
   child: charts.BarChart(
      series,
      animate: true,
      vertical: false,

      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>()
      // Hide domain axis.
     // domainAxis:
       //   new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    ));
  }
}

class PerfumeComments extends StatelessWidget {
  Perfume perfume;

  PerfumeComments(this.perfume);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(child: Text("comments"));
  }
}

class PerfumeLongevity extends StatelessWidget {
  Perfume perfume;

  PerfumeLongevity(this.perfume);
  @override
  Widget build(BuildContext context) {


     var data = [
      new Perfumebarchart("Poor", Colors.red, int.parse(perfume.longevity[1])),
      new Perfumebarchart("Weak", Colors.orange,int.parse(perfume.longevity[3])),
      new Perfumebarchart("Moderate", Colors.lime, int.parse(perfume.longevity[5])),
      new Perfumebarchart("Long Lasting", Colors.green, int.parse(perfume.longevity[7])),
      new Perfumebarchart("Very Long Lasting", Colors.indigo, int.parse(perfume.longevity[9])),

    ];

  
    var series =[
      new charts.Series<Perfumebarchart, String>(
          id: 'longevity',
          domainFn: (Perfumebarchart perfume, _) => perfume.property,
          measureFn: (Perfumebarchart perfume, _) => perfume.count,
          colorFn: (Perfumebarchart perfume, _) => perfume.color,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (Perfumebarchart perfume, _) =>
              '${perfume.property}: ${perfume.count}')
    ];
  
 return Container(
   padding: EdgeInsets.all(20),
   height: MediaQuery.of(context).size.height*.35,
   child: charts.BarChart(
      series,
      animate: true,
      vertical: false,

      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>()
      // Hide domain axis.
     // domainAxis:
       //   new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    ));
  }
}

class PerfumeSillage extends StatelessWidget {
  Perfume perfume;

  PerfumeSillage(this.perfume);
  @override
  Widget build(BuildContext context) {
    var data = [
      new Perfumebarchart("Poor", Colors.red, int.parse(perfume.sillage[1])),
      new Perfumebarchart("Weak", Colors.orange,int.parse(perfume.sillage[3])),
      new Perfumebarchart("Moderate", Colors.lime, int.parse(perfume.sillage[5])),
      new Perfumebarchart("Long Lasting", Colors.green, int.parse(perfume.sillage[7])),
    ];

  
    var series =[
      new charts.Series<Perfumebarchart, String>(
          id: 'longevity',
          domainFn: (Perfumebarchart perfume, _) => perfume.property,
          measureFn: (Perfumebarchart perfume, _) => perfume.count,
          colorFn: (Perfumebarchart perfume, _) => perfume.color,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (Perfumebarchart perfume, _) =>
              '${perfume.property}: ${perfume.count}')
    ];
  
 return Container(
   padding: EdgeInsets.all(20),
   height: MediaQuery.of(context).size.height*.35,
   child: charts.BarChart(
      series,
      animate: true,
      vertical: false,

      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>()
      // Hide domain axis.
     // domainAxis:
       //   new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    ));
  }
}

class PerfumeWhereToBuy extends StatelessWidget {
  Perfume perfume;

  PerfumeWhereToBuy(this.perfume);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(child: Text("Where to buy?"));
  }
}
