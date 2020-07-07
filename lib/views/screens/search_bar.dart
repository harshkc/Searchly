import 'package:flutter/material.dart';
import 'package:wed_assignment/core/enums/view_state.dart';
import 'package:wed_assignment/core/models/artist_work.dart';
import 'package:wed_assignment/core/services/search_service.dart';
import 'package:wed_assignment/views/shared/constants.dart';
import 'package:wed_assignment/views/shared/widgets/custom_tiles.dart';
import 'package:wed_assignment/views/shared/widgets/quiet_box.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  ViewState _viewState = ViewState.Idle;
  SearchService _searchService = SearchService();
  TextEditingController searchController = TextEditingController();
  String query = "";
  List<ArtistWork> works = [];
  bool searchError = false;

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
              onSubmitted: (val) {
                setState(() {
                  query = val;
                });
                getWorksList(query);
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
      body: searchError
          ? QuietBox(error: searchError)
          : works.isEmpty
              ? QuietBox()
              : _viewState == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.greenAccent,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: ListView.builder(
                        itemCount: works.length,
                        itemBuilder: (context, index) => CustomTile(
                          artistName: works[index].artistName,
                          songCover: works[index].artworkUrl100,
                          songName: works[index].trackName,
                        ),
                      ),
                    ),
    );
  }

  getWorksList(String name) async {
    toggleState();
    var _apiResponse = await _searchService.getWorksList(name);
    if (_apiResponse.error == true) {
      searchError = true;
      works = [];
    } else {
      setState(() {
        works = _apiResponse.data;
      });
    }
    toggleState();
  }

  toggleState() {
    _viewState == ViewState.Idle
        ? setState(() {
            _viewState = ViewState.Busy;
          })
        : setState(() {
            _viewState = ViewState.Idle;
          });
  }
}
