import 'package:flutter/material.dart';
import 'package:wed_assignment/views/shared/constants.dart';
import 'package:wed_assignment/views/shared/widgets/quiet_box.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkAccent,
      appBar: AppBar(
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: TextField(
              controller: searchController,
              onChanged: (val) {
                setState(() {
                  query = val;
                });
              },
              cursorColor: Colors.greenAccent,
              autofocus: true,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                suffixIcon: query.isEmpty
                    ? Icon(
                        Icons.line_style,
                        size: 0.0,
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => searchController.clear());
                          setState(() {
                            query = "";
                          });
                        },
                      ),
                border: InputBorder.none,
                hintText: "Search for artists",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(45.0),
        ),
      ),
      body: query.isEmpty ? QuietBox() : Container(color: kPurplishGrey),
    );
  }
}
