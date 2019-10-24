import '../../models/perfume.dart';
import 'package:flutter/material.dart';

class PerfumeDetailsBody extends StatelessWidget {
  final Perfume perfume;

  PerfumeDetailsBody(this.perfume);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    _createCircleBadge(
        {IconData icondata, Color color, int count, String perfumeproperty}) {
      return Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: CircleAvatar(
          backgroundColor: color,
          child: Column(
            children: <Widget>[
              Icon(
                icondata,
                color: Colors.white,
                size: 16.0,
              ),
              Text(
                count.toString(),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          radius: 20.0,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Year of make:",
            style: textTheme.headline,
            textAlign: TextAlign.start,
          ),
         
           Text(perfume.makeYear,
           ),
  
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Main Accords",
            style: textTheme.headline,
          ),
          Center(
            child: Text(perfume.mainAccords.toString(),
               ),
          ),
          SizedBox(
            height: 10.0,
          ),
         
      
    
     
        
       
          /*Row(
            children: <Widget>[
              _createCircleBadge(
                  icondata: Icons.favorite,
                  color: Colors.lightGreen,
                  count: perfume.love.length,
                  perfumeproperty: "love"),
              _createCircleBadge(
                  icondata: Icons.thumb_up,
                  color: Colors.lightGreen,
                  count: perfume.like.length,
                  perfumeproperty: "like"),
              _createCircleBadge(
                  icondata: Icons.thumb_down,
                  color: Colors.lightGreen,
                  count: perfume.dislike.length,
                  perfumeproperty: "dislike"),
              _createCircleBadge(
                  icondata: Icons.wb_sunny,
                  color: Colors.lightGreen,
                  count: perfume.summer.length,
                  perfumeproperty: "summer"),
              _createCircleBadge(
                  icondata: Icons.spa,
                  color: Colors.lightGreen,
                  count: perfume.fall.length,
                  perfumeproperty: "fall"),
              _createCircleBadge(
                  icondata: Icons.ac_unit,
                  color: Colors.lightGreen,
                  count: perfume.winter.length,
                  perfumeproperty: "winter"),
              _createCircleBadge(
                  icondata: Icons.local_florist,
                  color: Colors.lightGreen,
                  count: perfume.spring.length,
                  perfumeproperty: "spring"),
              _createCircleBadge(
                  icondata: Icons.brightness_low,
                  color: Colors.lightGreen,
                  count: perfume.day.length,
                  perfumeproperty: "day"),
              _createCircleBadge(
                  icondata: Icons.brightness_3,
                  color: Colors.lightGreen,
                  count: perfume.night.length,
                  perfumeproperty: "night"),
            ],
          ),*/
        ],
      ),
    );
  }
}
