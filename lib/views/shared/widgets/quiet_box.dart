import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuietBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          CupertinoIcons.search,
          size: size.height * 0.17,
          color: Colors.white,
        ),
        SizedBox(height: 10.0),
        Text(
          "Find the music you love",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          "Search for artists, songs, playlist, and more",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 25.0),
      ],
    ));
  }
}
