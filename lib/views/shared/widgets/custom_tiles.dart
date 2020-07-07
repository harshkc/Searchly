import 'package:flutter/material.dart';
import 'package:wed_assignment/views/shared/constants.dart';

class CustomTile extends StatelessWidget {
  final String artistName;
  final String songName;
  final String songCover;

  const CustomTile({this.songName, this.songCover, this.artistName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 50.0,
              width: 50.0,
              child: Image(image: NetworkImage(songCover)),
            ),
            SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  songName,
                  style: kTitleStyle,
                ),
                Text(
                  artistName,
                  style: kSubtitleStyle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
