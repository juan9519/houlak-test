import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houlak/bloc/artist/artist_bloc.dart';
import 'package:houlak/services/spotify_search.dart';
import 'package:houlak/widgets/no_results_widget.dart';
import 'package:spotify/spotify.dart' show Artist, Track;



///Retorna una listview con la info de los artistas (si encuentra)
class ArtistSuggestion extends StatelessWidget {
  final List<Artist> artists;

  ArtistSuggestion(this.artists);

  @override
  Widget build(BuildContext context) {
    if (artists.isEmpty) {
      return NoResults();
    } else {
      return ListView.builder(
        itemCount: artists.length,
        itemBuilder: (BuildContext context, int index) {
          Artist art = artists[index];
          return ListTile(
            leading: Container(
              height: 50,
              width: 50,
               child: art.images!.isNotEmpty ? Image.network(art.images!.first.url!) : Container()
            ),
            title: Text(art.name!),
            onTap: () => artistaSeleccionado(context,art.id!),
          );
        },
      );
    }
  }


  void artistaSeleccionado (BuildContext context,String idArtist) async {
    ArtistBloc aBloc = BlocProvider.of<ArtistBloc>(context);

    Artist artist = await SpotifySearch.artistDetail(idArtist);
    List<Track> topTracks = await SpotifySearch.topTracks(idArtist);

    aBloc.add(OnAddArtist(artist));
    aBloc.add(OnAddTopTracks(topTracks));

    Navigator.pushNamed(context, '/artist_detail');

  }
}
