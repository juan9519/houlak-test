import 'package:flutter/material.dart';
import 'package:houlak/services/spotify_search.dart';
import 'package:houlak/widgets/artist_suggestions_widget.dart';
import 'package:spotify/spotify.dart';

class MySearchBar extends SearchDelegate {
  final SpotifySearch _spotifySearch = SpotifySearch();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () => this.query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ""),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("hola");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder<List<Artist>>(
          future: _spotifySearch.searchArtist(query),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if(snapshot.hasError)
                  return Container();
                else
                return ArtistSuggestion(snapshot.data);
            }
          });
    }
  }
}
