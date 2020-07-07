import 'package:flutter/material.dart';
import 'package:wed_assignment/views/screens/search_bar.dart';
import 'package:wed_assignment/views/shared/constants.dart';

class SearchScreen extends StatelessWidget {
  final List<String> topGenres = ['Rock', 'Pop', 'Hip-Hop', 'Indie'];
  final List<String> browseAll = [
    'Podcasts',
    'New Releases',
    'Charts',
    'Mood',
    'Workout',
    'Decades',
    'Country',
    'Focus'
  ];
  final List<Color> colors = [
    Colors.greenAccent,
    Colors.amber,
    Colors.red,
    Colors.blueGrey,
    Colors.purpleAccent,
    Colors.orange,
    Colors.pink,
    Colors.teal,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkAccent,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor,
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                      ),
                    ),
                  )),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBar()),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.search),
                                ),
                                Text('Artists,Songs or Podcasts',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(
                            'Your top genres',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio:
                              (MediaQuery.of(context).size.width / (2 * 100)),
                          children: List.generate(4, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                    color: colors[index],
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 16, 0, 0),
                                    child: Text(
                                      topGenres[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            );
                          }),
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(
                            'Browse all',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio:
                              (MediaQuery.of(context).size.width / (2 * 100)),
                          children: List.generate(browseAll.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                    color: colors[7 - index],
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 16, 0, 0),
                                    child: Text(
                                      browseAll[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
