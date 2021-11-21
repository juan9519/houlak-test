import 'package:flutter/material.dart';
import 'package:houlak/services/spotify_search.dart';
import 'package:houlak/widgets/artist_suggestions_widget.dart';
import 'package:spotify/spotify.dart';

class MySearchBar extends SearchDelegate {
  final SpotifySearch _spotifySearch = SpotifySearch();

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar...';

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
    return buildArtistList(50);

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return buildArtistList(10);
  }

  Widget buildArtistList(int quantity) {
    if (query.isEmpty) {
      return Container();
    } else {
      return searchArtists(quantity);
    }
  }

  FutureBuilder<List<Artist>> searchArtists(int quantity) {
    return FutureBuilder<List<Artist>>(


        future: _spotifySearch.searchArtist(query, quantity),
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
