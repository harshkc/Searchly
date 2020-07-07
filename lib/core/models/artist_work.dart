class ArtistWork {
  String artistName;
  String trackName;
  String artistViewUrl;
  String artworkUrl100;

  ArtistWork({
    this.artistName,
    this.trackName,
    this.artistViewUrl,
    this.artworkUrl100,
  });

  Map<String, dynamic> toJson(ArtistWork work) {
    Map<String, dynamic> song = Map();
    song["artistName"] = work.artistName;
    song["trackName"] = work.trackName;
    song["artistViewUrl"] = work.artistViewUrl;
    song["artworkUrl100"] = work.artworkUrl100;
    return song;
  }

  ArtistWork.fromJson(Map work) {
    this.artistName = work["artistName"];
    this.trackName = work["trackName"];
    this.artistViewUrl = work["artistViewUrl"];
    this.artworkUrl100 = work["artworkUrl100"];
  }
}
